import 'package:flutter/material.dart';
import 'package:project03/screens/chat/widgets/chat_getmsg.dart';
import 'package:project03/screens/chat/widgets/chat_sendmsg.dart';

class ChatContentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        padding: EdgeInsets.all(20),
        children: [
          Column(
            children: [
              ChatGetmsg(),
              ChatSendmsg(),
            ],
          )
        ],
      ),
    );
  }
}
