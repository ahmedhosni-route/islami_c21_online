import 'package:flutter/material.dart';
import 'package:islamic_c21_online/core/theme/app_colors.dart';
import 'package:islamic_c21_online/modules/layout/screens/hadith_screen.dart';
import 'package:islamic_c21_online/modules/layout/screens/home_screen.dart';
import 'package:islamic_c21_online/modules/layout/screens/radio_screen.dart';
import 'package:islamic_c21_online/modules/layout/screens/sebha_screen.dart';
import 'package:islamic_c21_online/modules/layout/screens/time_screen.dart';

class LayoutScreen extends StatefulWidget {
  const LayoutScreen({super.key});

  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {
  int index = 0;
  List<Widget> screens = [
    HomeScreen(),
    HadithScreen(),
    SebhaScreen(),
    RadioScreen(),
    TimeScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: screens[index],
      backgroundColor: AppColors.black,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        onTap: (value) {
          index = value;
          setState(() {});
        },
        type: BottomNavigationBarType.fixed,
        backgroundColor: AppColors.gold,
        selectedItemColor: AppColors.white,
        showSelectedLabels: true,
        showUnselectedLabels: false,
        items: [
          btnNavItem("Quran", "assets/icons/ic_quran.png"),
          btnNavItem("Hadith", "assets/icons/book-album-svgrepo-com 1.png"),
          btnNavItem("Sebha", "assets/icons/necklace-islam-svgrepo-com 1.png"),
          btnNavItem("Radio", "assets/icons/radio-svgrepo-com 1.png"),
          btnNavItem("Time", "assets/icons/time.png"),
        ],
      ),
    );
  }

  BottomNavigationBarItem btnNavItem(String label, String icon) {
    return BottomNavigationBarItem(
      icon: Image.asset(icon, height: 24),
      label: label,
      activeIcon: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        decoration: BoxDecoration(
          color: AppColors.black.withValues(alpha: 0.6),
          borderRadius: BorderRadius.circular(24),
        ),
        child: Image.asset(icon, color: AppColors.white, height: 24),
      ),
    );
  }
}
