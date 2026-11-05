import 'package:flutter/material.dart';
import 'package:islamic_c21_online/core/theme/app_colors.dart';
import 'package:islamic_c21_online/modules/layout/screens/hadith_screen.dart';

class HadethDetailsScreen extends StatelessWidget {
  HadethData hadeth;

  HadethDetailsScreen({super.key, required this.hadeth});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: AppBar(
        foregroundColor: AppColors.gold,
        backgroundColor: Colors.transparent,
        title: Text(hadeth.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          children: [
            Positioned(
              bottom: 0,
              child: Image.asset("assets/images/footer.png"),
            ),
            Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Image.asset("assets/images/img_left_corner.png"),
                    ),
                    Expanded(
                      flex: 2,
                      child: Center(
                        child: Text(
                          hadeth.title,
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                            color: AppColors.gold,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Image.asset("assets/images/img_right_corner.png"),
                    ),
                  ],
                ),

                Expanded(
                  child: Text(
                    hadeth.body,
                    style: TextStyle(fontSize: 24, color: AppColors.gold),
                    textDirection: TextDirection.rtl,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
