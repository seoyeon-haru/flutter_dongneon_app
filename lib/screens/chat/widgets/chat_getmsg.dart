import 'package:flutter/material.dart';
import 'package:project03/utils/app_theme.dart';
import 'package:project03/utils/date_util.dart';

class ChatGetMsg extends StatelessWidget {
  ChatGetMsg({
    required this.imgUrl,
    required this.showProfile,
    required this.name,
    required this.content,
    required this.dateTime,
    required this.showTimestamp,
  });
  final String imgUrl;
  final bool showProfile;
  final String name;
  final String content;
  final DateTime dateTime;
  final bool showTimestamp;
  @override
  Widget build(BuildContext context) {
    // imgUrl이 비어있는지 확인하여 적절한 ImageProvider를 선택합니다.
    final ImageProvider profileImage = imgUrl.isNotEmpty
        ? NetworkImage(imgUrl)
        : const AssetImage('assets/ic_person.png');

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 50,
          child: showProfile
              ? CircleAvatar(
                  radius: 25,
                  backgroundImage: profileImage,
                )
              : null,
        ),
        const SizedBox(width: 8),
        Flexible(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (showProfile)
                      Text(
                        name,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 14),
                      ),
                    if (showProfile) const SizedBox(height: 4),
                    Container(
                      decoration: BoxDecoration(
                        color: AppColors.secondary,
                        borderRadius: BorderRadius.circular(16),
                        border:
                            Border.all(color: AppColors.primary, width: 1.0),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      child: Text(
                        content,
                        style: AppTextStyles.tealText20.copyWith(fontSize: 15),
                      ),
                    ),
                  ],
                ),
              ),
              if (showTimestamp) const SizedBox(width: 8),
              if (showTimestamp)
                Text(DateUtil.formatMessageTime(dateTime),
                    style: AppTextStyles.placeHolderText)
            ],
          ),
        ),
      ],
    );
  }
}
