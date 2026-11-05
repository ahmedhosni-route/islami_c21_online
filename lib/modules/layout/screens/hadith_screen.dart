import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamic_c21_online/core/theme/app_colors.dart';
import 'package:islamic_c21_online/modules/hadeth_details/screens/hadeth_details_screen.dart';

class HadithScreen extends StatefulWidget {
  const HadithScreen({super.key});

  @override
  State<HadithScreen> createState() => _HadithScreenState();
}

class _HadithScreenState extends State<HadithScreen> {
  List<HadethData> ahadeth = [];

  @override
  Widget build(BuildContext context) {
    if (ahadeth.isEmpty) {
      readAhadeth();
    }
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/hadeth_bg.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: SafeArea(
        child: Column(
          children: [
            Center(
              child: Image.asset("assets/logo/logo_header.png", width: 300),
            ),

            Expanded(
              child: CarouselSlider.builder(
                itemCount: ahadeth.length,
                itemBuilder: (context, index, realIndex) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (
                          context) {
                        return HadethDetailsScreen(hadeth: ahadeth[index]);
                      },));
                    },
                    child: Container(
                      padding: EdgeInsets.only(
                          top: 12,
                          right: 12,
                          left: 12
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.gold,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Image.asset(
                                  "assets/images/img_left_corner.png",
                                  color: AppColors.black,
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Center(
                                  child: FittedBox(
                                    child: Text(
                                      ahadeth[index].title,
                                      style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.w700,
                                        color: AppColors.black,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Image.asset(
                                  "assets/images/img_right_corner.png",
                                  color: AppColors.black,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 12),
                          Expanded(
                            child: Stack(
                              children: [
                                Column(
                                  children: [
                                    Expanded(child: Image.asset(
                                        "assets/images/hadeth_card_bg.png")),
                                    Image.asset("assets/images/footer.png",
                                      color: AppColors.black,),

                                  ],
                                ),

                                Text(
                                  ahadeth[index].body,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                  ),
                                  textDirection: TextDirection.rtl,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                options: CarouselOptions(
                  height: 1000,
                  aspectRatio: 16 / 9,
                  viewportFraction: 0.8,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  reverse: false,
                  autoPlayInterval: Duration(seconds: 3),
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enlargeCenterPage: true,
                  enlargeFactor: 0.3,
                  scrollDirection: Axis.horizontal,
                ),
              ),
            ),
            SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  void readAhadeth() async {
    for (int i = 1; i <= 50; i++) {
      String value = await rootBundle.loadString("assets/hadeeth/h$i.txt");
      value = value.trim();
      HadethData hadeth = HadethData(
        title: value.split("\n")[0].trim(),
        body: value.split("\n")[1].trim(),
      );
      ahadeth.add(hadeth);
    }
    setState(() {});
  }
}

class HadethData {
  String title;
  String body;

  HadethData({required this.title, required this.body});
}
