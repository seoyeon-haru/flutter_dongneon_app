// 앱 테마 설정

import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  // 청색..? (Teal) - 4C9DB0
  static const Color primary = Color(0xFF4C9DB0);

  // 노란색 (Cream Yellow) - FFEBB0
  static const Color secondary = Color(0xFFFFEBB0);

  // 검정색 (Black) - 000000
  static const Color black = Color(0xFF000000);

  // 흰색
  static const Color white = Color(0xFFFFFFFF);
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
