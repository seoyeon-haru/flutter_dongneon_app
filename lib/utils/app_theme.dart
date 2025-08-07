// 앱 테마 설정

import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  // 청색..? (Teal) - 4C9DB0
  static const Color primary = Color(0xFF4C9DB0);

  // 노란색 (Cream Yellow) - FFEBB0
  static const Color secondary = Color(0xFFFFEBB0);

  // 갈색 (Brown) - BF8E68
  static const Color brown = Color(0xFFBF8E68);

  // 검정색 (Black) - 000000
  static const Color black = Color(0xFF000000);

  // 검정색2 (Black) - 121212
  static const Color black2 = Color(0xFF121212);

  // 흰색
  static const Color white = Color(0xFFFFFFFF);

  // 회색 - 플레이스홀더 색
  static const Color grey = Color(0xFFDADADA);
}

class AppTextStyles {
  AppTextStyles._(); // 인스턴스화 방지

  // Jua 폰트를 사용하는 텍스트 스타일
  static const TextStyle headline = TextStyle(
    fontFamily: 'Jua',
    fontSize: 32,
    color: AppColors.black,
    fontWeight: FontWeight.normal,
  );

  static const TextStyle appBarTitle = TextStyle(
    fontFamily: 'Jua',
    fontSize: 20,
    color: AppColors.black2,
    fontWeight: FontWeight.normal,
  );

  static const TextStyle tealText20 = TextStyle(
    fontFamily: 'Jua',
    fontSize: 20,
    color: AppColors.primary,
    fontWeight: FontWeight.normal,
  );

  static const TextStyle brownText18 = TextStyle(
    fontFamily: 'Jua',
    fontSize: 18,
    color: AppColors.brown,
    fontWeight: FontWeight.normal,
  );

  static const TextStyle placeHolderText = TextStyle(
    fontFamily: 'Jua',
    fontSize: 13,
    color: AppColors.grey,
    fontWeight: FontWeight.normal,
  );

  static const TextStyle greyText18 = TextStyle(
    fontFamily: 'Jua',
    fontSize: 18,
    color: AppColors.grey,
    fontWeight: FontWeight.normal,
  );

  static const TextStyle title = TextStyle(
    fontFamily: 'Jua',
    fontSize: 24,
    color: AppColors.black,
  );

  static const TextStyle body = TextStyle(
    fontFamily: 'Jua',
    fontSize: 18,
    color: AppColors.black,
  );

  static const TextStyle buttonPrimary = TextStyle(
    fontFamily: 'Jua',
    fontSize: 20,
    color: AppColors.white,
  );
}
