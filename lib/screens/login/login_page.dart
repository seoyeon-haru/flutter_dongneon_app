import 'package:flutter/material.dart';
import '../chat/chat_page.dart';
import '../../models/user_state.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('게스트로 시작하기'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ChatPage(userState: UserState()),
              ),
            );
          },
          child: Text('시작하기'),
        ),
      ),
    );
  }
} 