import 'package:flutter/material.dart';
import 'package:project03/utils/app_theme.dart';

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
    // 시간을 '오전/오후 h:mm' 형식으로 변환하는 로직
    String period = dateTime.hour < 12 ? '오전' : '오후';
    int hour = dateTime.hour % 12;
    if (hour == 0) {
      hour = 12; // 0시는 12시로, 12시는 12시로 표시
    }
    String minute = dateTime.minute.toString().padLeft(2, '0');
    final formattedTime = '$period $hour:$minute';

    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        if (showTimestamp)
          Text(
            formattedTime,
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
