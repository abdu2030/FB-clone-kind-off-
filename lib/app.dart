import 'package:flutter/material.dart';
import 'package:lab1/auth/login_screen.dart';

class FacebookCloneApp extends StatelessWidget {
  const FacebookCloneApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Facebook Clone',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFF0F2F5),
        primaryColor: const Color(0xFF1877F2),
      ),
      home: const LoginScreen(),
    );
  }
}
