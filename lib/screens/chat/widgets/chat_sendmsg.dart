import 'package:flutter/material.dart';
import 'package:project03/utils/app_theme.dart';
import 'package:project03/utils/date_util.dart';

class ChatSendMsg extends StatelessWidget {
  const ChatSendMsg({
    super.key,
    required this.content,
    required this.dateTime,
    required this.showTimestamp,
  });
  final String content;
  final DateTime dateTime;
  final bool showTimestamp;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        if (showTimestamp)
          Text(
            DateUtil.formatMessageTime(dateTime),
            style: AppTextStyles.placeHolderText,
          ),
        if (showTimestamp) const SizedBox(width: 8),
        Flexible(
          child: Container(
              decoration: BoxDecoration(
                  color: AppColors.secondary,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: AppColors.primary, width: 1.0)),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Text(
                content,
                style: AppTextStyles.body.copyWith(fontSize: 15),
              )),
        ),
      ],
    );
  }
}
