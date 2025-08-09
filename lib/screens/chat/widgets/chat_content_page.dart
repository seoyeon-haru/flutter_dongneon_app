import 'package:flutter/material.dart';
import 'package:project03/models/chat_model.dart';
import 'package:project03/screens/chat/widgets/chat_getmsg.dart';
import 'package:project03/screens/chat/widgets/chat_sendmsg.dart';

class ChatContentPage extends StatelessWidget {
  final List<Chat> chats;
  final String currentUserId;

  const ChatContentPage({
    super.key,
    required this.chats,
    required this.currentUserId,
  });

  @override
  Widget build(BuildContext context) {
    // 새 메시지가 오면 맨 아래로 스크롤하기 위한 컨트롤러
    final ScrollController scrollController = ScrollController();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (scrollController.hasClients) {
        scrollController.jumpTo(scrollController.position.maxScrollExtent);
      }
    });

    return ListView.separated(
      controller: scrollController,
      // 하단 입력창에 가려지지 않도록 아래쪽에 여백 추가
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 90),
      itemCount: chats.length,
      separatorBuilder: (context, index) => const SizedBox(height: 10),
      itemBuilder: (context, index) {
        final chat = chats[index];
        final isMe = chat.senderId == currentUserId;

        if (isMe) {
          return ChatSendMsg(
            name: chat.sender,
            content: chat.message,
            dateTime: chat.timestamp,
          );
        } else {
          // 같은 사람이 보낸 연속된 메시지에서는 프로필을 한 번만 보여주기 위한 로직
          final bool showProfile =
              index == 0 || chats[index - 1].senderId != chat.senderId;
          return ChatGetMsg(
            imgUrl: chat.profileImgUrl ?? '', // 프로필 이미지가 없으면 빈 문자열 전달
            showProfile: showProfile,
            name: chat.sender,
            content: chat.message,
            dateTime: chat.timestamp,
          );
        }
      },
    );
  }
}
