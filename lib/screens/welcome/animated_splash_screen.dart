import 'dart:async';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:project03/screens/login/login_page.dart'; // 애니메이션이 끝나고 보여줄 메인 화면
// import 'screens/login/login_page.dart';

class AnimatedSplashScreen extends StatefulWidget {
  const AnimatedSplashScreen({super.key});

  @override
  State<AnimatedSplashScreen> createState() => _AnimatedSplashScreenState();
}

class _AnimatedSplashScreenState extends State<AnimatedSplashScreen> {
  @override
  void initState() {
    super.initState();
    // 3초 후에 메인 화면으로 이동
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => LoginPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 1. 네이티브 스플래시와 배경색을 비슷하게
      backgroundColor: Colors.white,
      body: Center(
        // 2. Lottie 애니메이션의 크기를 고정하여 예측 가능하게 만듬
        child: SizedBox(
          width: 500,
          height: 500,
          child: Lottie.asset('assets/wink-logo.json'),
        ),
      ),
    );
  }
}
