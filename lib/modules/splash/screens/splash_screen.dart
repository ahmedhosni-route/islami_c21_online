import 'package:flutter/material.dart';
import 'package:islamic_c21_online/core/theme/app_colors.dart';
import 'package:islamic_c21_online/modules/layout/screens/layout_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 4), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) {
            return LayoutScreen();
          },
        ),
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Center(child: Image.asset("assets/logo/ic_splash.png")),
            ),
            Image.asset("assets/logo/img_branding.png", width: 244),
          ],
        ),
      ),
    );
  }
}
