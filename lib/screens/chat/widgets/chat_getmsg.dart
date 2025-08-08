import 'package:flutter/material.dart';
import 'package:project03/utils/app_theme.dart';
import 'package:project03/utils/user_profile_image.dart';

class ChatGetMsg extends StatelessWidget {
  ChatGetMsg({
    required this.imgUrl,
    required this.showProfile,
    required this.name,
    required this.content,
    required this.dateTime,
  });
  final String imgUrl;
  final bool showProfile;
  final String name;
  final String content;
  final DateTime dateTime;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        showProfile
            ? UserProfileImage(
                demension: 50,
                imgUrl: imgUrl,
              )
            : SizedBox(width: 50),
        SizedBox(width: 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(name),
              Container(
                decoration: BoxDecoration(
                  color: AppColors.secondary,
                  borderRadius: BorderRadius.circular(16),
                ),
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Text(
                  content,
                  style: AppTextStyles.tealText20.copyWith(fontSize: 15),
                ),
              ),
              Text(
                dateTime.toIso8601String(),
                style: AppTextStyles.placeHolderText,
              )
            ],
          ),
        ),
      ],
    );
  }
}
