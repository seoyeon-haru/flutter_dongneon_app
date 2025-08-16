import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:project03/firebase_options.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'screens/login/login_page.dart';
import 'screens/welcome/animated_splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AnimatedSplashScreen(),
    );
  }
}
