import 'package:flutter/material.dart';
import 'package:project03/screens/chat/widgets/chat_getmsg.dart';
import 'package:project03/screens/chat/widgets/chat_sendmsg.dart';

class ChatContentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final children = [
      ChatGetMsg(
        imgUrl: 'https://picsum.photos/200/300',
        showProfile: true,
        name: '서연',
        content: '안녕하세요',
        dateTime: DateTime.now(),
      ),
      ChatGetMsg(
        imgUrl: 'https://picsum.photos/200/300',
        showProfile: false,
        name: '서연',
        content: '잘 지내시나요?',
        dateTime: DateTime.now(),
      ),
      ChatSendMsg(
        name: '이샘',
        content: '안녕하세요',
        dateTime: DateTime.now(),
      ),
      ChatSendMsg(
        name: '이샘',
        content: '잘 지내고 있습니다!',
        dateTime: DateTime.now(),
      ),
    ];
    return Expanded(
      child: ListView.separated(
        itemCount: children.length,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        separatorBuilder: (context, index) => SizedBox(height: 10),
        itemBuilder: (context, index) {
          return children[index];
        },
      ),
    );
  }
}
