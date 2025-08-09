import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project03/models/chat_model.dart';

class ChatRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // 메시지를 Firestore에 저장하는 메서드
  Future<void> sendMessage(Chat chat) async {
    await _firestore.collection('chats').doc(chat.messageId).set(chat.toMap());
  }

  // 채팅 메시지 목록을 실시간으로 가져오는 Stream
  Stream<List<Chat>> getChatStream() {
    return _firestore
        .collection('chats')
        .orderBy('timestamp', descending: false)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) {
        return Chat.fromMap(doc.data());
      }).toList();
    });
  }
}

final chatRepositoryProvider = Provider((ref) => ChatRepository());
