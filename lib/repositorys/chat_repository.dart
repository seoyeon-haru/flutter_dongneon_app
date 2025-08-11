import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:project03/models/chat_model.dart';

/// Firestore의 'chats' 컬렉션과 상호작용하는 클래스
class ChatRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  /// 'chats' 컬렉션의 모든 메시지를 시간순으로 가져오는 스트림을 반환
  Stream<List<Chat>> getChatsStream() {
    return _firestore
        .collection('chats')
        .orderBy('timestamp', descending: false)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) => Chat.fromMap(doc.data())).toList();
    });
  }

  /// 새로운 채팅 메시지를 'chats' 컬렉션에 추가
  Future<void> addMessage(Chat chat) async {
    // chat.messageId를 문서 ID로 사용하여 데이터를 설정
    await _firestore.collection('chats').doc(chat.messageId).set(chat.toMap());
  }
}
