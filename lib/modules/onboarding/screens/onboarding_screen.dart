import 'package:flutter/material.dart';
import 'package:islamic_c21_online/core/theme/app_colors.dart';
import 'package:islamic_c21_online/modules/layout/screens/layout_screen.dart';

class _OnboardingItem {
  final String image;
  final String title;
  final String? description;

  const _OnboardingItem({
    required this.image,
    required this.title,
    this.description,
  });
}

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  static const String _headerLogo = 'assets/logo/logo_header.png';
  static const List<_OnboardingItem> _items = [
    _OnboardingItem(
      image: 'assets/images/welcome.png',
      title: 'Welcome To Islmi App',
    ),
    _OnboardingItem(
      image: 'assets/images/kabba.png',
      title: 'Welcome To Islami',
      description: 'We Are Very Excited To Have You In Our Community',
    ),
    _OnboardingItem(
      image: 'assets/images/reading.png',
      title: 'Reading the Quran',
      description: 'Read, and your Lord is the Most Generous',
    ),
    _OnboardingItem(
      image: 'assets/images/bearish.png',
      title: 'Bearish',
      description: 'Praise the name of your Lord, the Most High',
    ),
    _OnboardingItem(
      image: 'assets/images/radio.png',
      title: 'Holy Quran Radio',
      description:
      'You can listen to the Holy Quran Radio through the application for free and easily',
    ),
  ];

  final PageController _controller = PageController();
  int _currentIndex = 0;

  bool get _isFirst => _currentIndex == 0;
  bool get _isLast => _currentIndex == _items.length - 1;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _goNext() {
    if (_isLast) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LayoutScreen()),
      );
      return;
    }
    _controller.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void _goBack() {
    _controller.previousPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 8),
            Image.asset(
              _headerLogo,
              width: 291,
              height: 171,
              fit: BoxFit.contain,
            ),
            Expanded(
              child: PageView.builder(
                controller: _controller,
                itemCount: _items.length,
                onPageChanged: (index) => setState(() => _currentIndex = index),
                itemBuilder: (context, index) {
                  final item = _items[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      children: [
                        Expanded(
                          child: Image.asset(item.image, fit: BoxFit.contain),
                        ),
                        const SizedBox(height: 24),
                        Text(
                          item.title,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontFamily: 'Janna',
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: AppColors.gold,
                          ),
                        ),
                        if (item.description != null) ...[
                          const SizedBox(height: 16),
                          Text(
                            item.description!,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontFamily: 'Janna',
                              fontSize: 16,
                              color: AppColors.gold,
                            ),
                          ),
                        ],
                      ],
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 24),

            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
              child: Row(
                children: [
                  Expanded(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: _isFirst
                          ? const SizedBox.shrink()
                          : TextButton(
                        onPressed: _goBack,
                        child: const Text(
                          'Back',
                          style: TextStyle(
                            fontFamily: 'Janna',
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: AppColors.gold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: List.generate(_items.length, (index) {
                      final isActive = index == _currentIndex;
                      return AnimatedContainer(
                        duration: const Duration(milliseconds: 250),
                        margin: const EdgeInsets.symmetric(horizontal: 3),
                        width: isActive ? 20 : 8,
                        height: 8,
                        decoration: BoxDecoration(
                          color: isActive
                              ? AppColors.gold
                              : AppColors.gold.withValues(alpha: 0.4),
                          borderRadius: BorderRadius.circular(4),
                        ),
                      );
                    }),
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: _goNext,
                        child: Text(
                          _isLast ? 'Finish' : 'Next',
                          style: const TextStyle(
                            fontFamily: 'Janna',
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: AppColors.gold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}