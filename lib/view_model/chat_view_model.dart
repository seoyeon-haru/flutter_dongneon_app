import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project03/models/chat_model.dart';
import 'package:project03/models/user_state.dart';
import 'package:project03/repositorys/chat_repository.dart';

/// ChatRepository 인스턴스를 제공하는 Provider
final chatRepositoryProvider = Provider((ref) => ChatRepository());

/// 채팅 목록을 실시간으로 제공하는 StreamProvider
/// chat_page.dart에서 이 provider를 watch하여 UI를 업데이트
final chatStreamProvider = StreamProvider.autoDispose<List<Chat>>((ref) {
  final repository = ref.watch(chatRepositoryProvider);
  return repository.getChatsStream();
});

/// 채팅 관련 비즈니스 로직을 처리하는 ViewModel
final chatViewModelProvider =
    NotifierProvider<ChatViewModel, void>(ChatViewModel.new);

class ChatViewModel extends Notifier<void> {
  @override
  void build() {}

  /// 메시지를 Firestore에 전송하는 함수
  Future<void> sendMessage({
    required String message,
    required UserState userState,
  }) async {
    final chatRepository = ref.read(chatRepositoryProvider);

    // Firestore에서 고유한 문서 ID를 미리 생성
    final messageId = FirebaseFirestore.instance.collection('chats').doc().id;

    // 전달받은 정보와 Chat 모델을 사용하여 새로운 Chat 객체를 생성
    final newChat = Chat(
      messageId: messageId,
      senderId: userState.senderId,
      sender: userState.sender,
      message: message,
      profileImgUrl: userState.profileImgUrl,
      timestamp: DateTime.now(),
    );

    // Repository를 통해 Firestore에 데이터를 추가
    await chatRepository.addMessage(newChat);
  }
}
