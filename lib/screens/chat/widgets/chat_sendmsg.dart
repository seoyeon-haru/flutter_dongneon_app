import 'package:flutter/material.dart';
import 'package:project03/utils/app_theme.dart';

class ChatSendMsg extends StatelessWidget {
  ChatSendMsg({
    required this.name,
    required this.content,
    required this.dateTime,
  });
  final String name;
  final String content;
  final DateTime dateTime;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(name),
        Container(
            decoration: BoxDecoration(
                color: AppColors.secondary,
                borderRadius: BorderRadius.circular(16)),
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Text(
              content,
              style: AppTextStyles.body.copyWith(fontSize: 15),
            )),
        Text(
          dateTime.toIso8601String(),
          style: AppTextStyles.placeHolderText,
        )
      ],
    );
  }
}
