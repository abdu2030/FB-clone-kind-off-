import 'package:flutter/material.dart';
import 'login_screen.dart';

void logout(BuildContext context) {
  Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(builder: (_) => const LoginScreen()),
    (route) => false,
  );
}
