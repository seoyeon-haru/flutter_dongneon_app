import 'package:flutter/material.dart';

class UserProfileImage extends StatelessWidget { // 임시
  const UserProfileImage({
    super.key,
    required this.demension,
    required this.imgUrl,
  });
  final double demension;
  final String imgUrl;
  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: demension,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: Image.network(
          imgUrl,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
