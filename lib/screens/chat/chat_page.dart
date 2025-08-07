import 'package:flutter/material.dart';
import 'package:project03/screens/chat/widgets/chat_bottom_page.dart';
import 'package:project03/screens/chat/widgets/chat_content_page.dart';
import 'package:project03/utils/app_theme.dart';
import '../../models/user_state.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key, required this.userState});
  final UserState userState;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: Text(
            '부산광역시 동래구 온천동',
            style: AppTextStyles.title
          ),
        ),
        body: Column(
          children: [
            ChatContentPage(),
            ChatBottomPage(),
          ],
        ),
        backgroundColor: Colors.grey[200],
      ),
    );
  }
}
