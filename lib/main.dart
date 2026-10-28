import 'package:flutter/material.dart';
import 'package:islamic_c21_online/modules/splash/screens/splash_screen.dart';

void main() {
  // Ahmed Hosni
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: SplashScreen());
  }
}
