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
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 120),
      itemCount: chats.length,
      separatorBuilder: (context, index) => const SizedBox(height: 10),
      itemBuilder: (context, index) {
        final chat = chats[index];
        final isMe = chat.senderId == currentUserId;

        // 이전 메시지와 다음 메시지 정보 가져오기
        final Chat? prevChat = index > 0 ? chats[index - 1] : null;
        final Chat? nextChat =
            index < chats.length - 1 ? chats[index + 1] : null;

        // 프로필을 표시할지 결정하는 로직
        // - 이전 메시지가 없거나,
        // - 이전 메시지를 보낸 사람과 다르거나,
        // - 이전 메시지와 보낸 시간이 1분 이상 차이 날 때
        final bool showProfile = prevChat == null ||
            prevChat.senderId != chat.senderId ||
            chat.timestamp.difference(prevChat.timestamp).inMinutes >= 1;

        // 시간을 표시할지 결정하는 로직
        // - 다음 메시지가 없거나,
        // - 다음 메시지를 보낸 사람과 다르거나,
        // - 다음 메시지와 보낸 시간이 1분 이상 차이 날 때
        final bool showTimestamp = nextChat == null ||
            nextChat.senderId != chat.senderId ||
            nextChat.timestamp.difference(chat.timestamp).inMinutes >= 1;

        if (isMe) {
          return ChatSendMsg(
            content: chat.message,
            dateTime: chat.timestamp,
            showTimestamp: showTimestamp,
          );
        } else {
          return ChatGetMsg(
            imgUrl: chat.profileImgUrl ?? '',
            showProfile: showProfile,
            name: chat.sender,
            content: chat.message,
            dateTime: chat.timestamp,
            showTimestamp: showTimestamp,
          );
        }
      },
    );
  }
}
