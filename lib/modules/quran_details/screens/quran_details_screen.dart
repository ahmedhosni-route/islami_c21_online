import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamic_c21_online/core/theme/app_colors.dart';

class QuranDetailsScreen extends StatefulWidget {
  SuraModel sura;

  QuranDetailsScreen({super.key, required this.sura});

  @override
  State<QuranDetailsScreen> createState() => _QuranDetailsScreenState();
}

class _QuranDetailsScreenState extends State<QuranDetailsScreen> {
  List<String> suraList = [];
  @override
  Widget build(BuildContext context) {
    if (suraList.isEmpty) {
      readFile(widget.sura.id);
    }
    return Scaffold(

      
      backgroundColor: AppColors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        foregroundColor: AppColors.gold,
        title: Text(widget.sura.suraNameEn),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                    child: Image.asset("assets/images/img_left_corner.png")),
                Expanded(
                  flex: 2,
                  child: Center(
                    child: Text(
                      widget.sura.suraNameAr,
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
              child: SingleChildScrollView(
                child: Text.rich(TextSpan(
                    children: suraList.map((e) {
                      int index = suraList.indexOf(e);
                      return TextSpan(
                        text: "$e[${index + 1}] ",
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            showModalBottomSheet(
                              context: context, builder: (context) {
                              return Center(child: Text(e),);
                            },);
                          },
                      style: TextStyle(
                        fontSize: 18,
                        color: AppColors.gold,
                        fontWeight: FontWeight.w600,
                          height: 2.2
                      ),
                      );
                    },).toList()
                ),
                  textDirection: TextDirection.rtl,
                ),
              ),
            )


            // Expanded(
            //   child: ListView.builder(
            //     itemCount: suraList.length,
            //     itemBuilder: (context, index) {
            //       return Container(
            //         margin: EdgeInsets.all(4),
            //         padding: EdgeInsets.all(8),
            //         decoration: BoxDecoration(
            //           borderRadius: BorderRadius.circular(15),
            //           border: Border.all(color: AppColors.gold),
            //         ),
            //         child: Center(
            //           child: Text(
            //             suraList[index] + "[${index + 1}]",
            //             style: TextStyle(
            //               fontSize: 18,
            //               color: AppColors.gold,
            //               fontWeight: FontWeight.w600,
            //             ),
            //             textDirection: TextDirection.rtl,
            //           ),
            //         ),
            //       );
            //     },
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  void readFile(String id) async {
    var sura = await rootBundle.loadString("assets/suras/$id.txt");
    sura = sura.trim();
    suraList = sura.split("\n");
    print(sura);
    setState(() {});
  }
}

class SuraModel {
  String id;
  String suraNameAr;
  String suraNameEn;
  String verses;

  SuraModel({
    required this.id,
    required this.verses,
    required this.suraNameAr,
    required this.suraNameEn,
  });
}
