import 'package:flutter/material.dart';
import 'package:islamic_c21_online/core/theme/app_colors.dart';

class SebhaScreen extends StatefulWidget {
  const SebhaScreen({super.key});

  @override
  State<SebhaScreen> createState() => _SebhaScreenState();
}

class _SebhaScreenState extends State<SebhaScreen> {
  static const String _background = 'assets/images/sebha_bg.jpg';
  static const String _headerLogo = 'assets/logo/logo_header.png';
  static const String _head = 'assets/images/sebha_head.png';
  static const String _beads = 'assets/images/sebha_beads.png';

  static const int _beadsCount = 33;
  static const List<String> _azkar = [
    'سبحان الله',
    'الحمد لله',
    'الله أكبر',
  ];

  int _counter = 0;
  int _azkarIndex = 0;
  double _turns = 0;

  void _onTap() {
    setState(() {
      if (_counter == _beadsCount) {
        _counter = 0;
        _azkarIndex = (_azkarIndex + 1) % _azkar.length;
      }
      _counter++;
      _turns += 1 / _beadsCount;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.black,
        image: DecorationImage(
          image: const AssetImage(_background),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            AppColors.black.withValues(alpha: 0.6),
            BlendMode.darken,
          ),
        ),
      ),
      child: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 8),
            Image.asset(
              _headerLogo,
              width: 291,
              height: 171,
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 16),
            const Text(
              'سَبِّحِ اسْمَ رَبِّكَ الأعلى',
              style: TextStyle(
                fontFamily: 'Janna',
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppColors.white,
              ),
            ),
            const SizedBox(height: 16),

        Center(
          child: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: _onTap,
            child: SizedBox(
              width: 379,
              height: 460,
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  Positioned(
                    top: 50,
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        AnimatedRotation(
                          turns: _turns,
                          duration: const Duration(milliseconds: 300),
                          child: Image.asset(_beads, fit: BoxFit.contain),
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              _azkar[_azkarIndex],
                              style: const TextStyle(
                                fontFamily: 'Janna',
                                fontSize: 36,
                                fontWeight: FontWeight.bold,
                                color: AppColors.white,
                              ),
                            ),
                            const SizedBox(height: 16),
                            Text(
                              '$_counter',
                              style: const TextStyle(
                                fontFamily: 'Janna',
                                fontSize: 36,
                                fontWeight: FontWeight.bold,
                                color: AppColors.white,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Image.asset(_head, height: 90),
                  ],
                ),
              ),
            ),
          ),
          ],
        ),
      ),
    );
  }
}