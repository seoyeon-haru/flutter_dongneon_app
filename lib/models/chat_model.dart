import 'package:flutter/foundation.dart';

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
}
