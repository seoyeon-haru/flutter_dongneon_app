import 'package:flutter/foundation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

/// 개별 채팅 메시지를 나타내는 모델 클래스
@immutable
class Chat {
  final String messageId;
  final String senderId;
  final String sender;
  final String message;
  final String? profileImgUrl;
  final DateTime timestamp;

  const Chat({
    required this.messageId,
    required this.senderId,
    required this.sender,
    required this.message,
    this.profileImgUrl,
    required this.timestamp,
  });

  // Firestore와 데이터를 주고받기 위한 변환 메서드
  Map<String, dynamic> toMap() {
    return {
      'messageId': messageId,
      'senderId': senderId,
      'sender': sender,
      'message': message,
      'profileImgUrl': profileImgUrl,
      'timestamp': Timestamp.fromDate(timestamp),
    };
  }

  factory Chat.fromMap(Map<String, dynamic> map) {
    return Chat(
      messageId: map['messageId'] ?? '',
      senderId: map['senderId'] ?? '',
      sender: map['sender'] ?? '',
      message: map['message'] ?? '',
      profileImgUrl: map['profileImgUrl'],
      // Firestore의 Timestamp를 Dart의 DateTime으로 변환
      timestamp: (map['timestamp'] as Timestamp).toDate(),
    );
  }
}
