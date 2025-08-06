import 'package:flutter/material.dart';
import '../../models/user_state.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key, required this.userState});
  final UserState userState;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('채팅'),
      ),
      body: const Center(
        child: Text('채팅'),
      ),
    );
  }
}