import 'package:flutter/material.dart';
import 'package:islamic_c21_online/core/app_data/app_data.dart';
import 'package:islamic_c21_online/core/theme/app_colors.dart';
import 'package:islamic_c21_online/modules/quran_details/screens/quran_details_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<int> searchIndex = [];
  bool isSearch = false;
  List<String> mostList = [];

  @override
  void initState() {
    getMost();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/home_image.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [AppColors.black.withValues(alpha: 0.7), AppColors.black],
            end: AlignmentGeometry.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Center(
                child: Image.asset("assets/logo/logo_header.png", width: 300),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: TextField(
                  style: TextStyle(color: AppColors.white),
                  onChanged: (value) {
                    search(value);
                  },
                  decoration: InputDecoration(
                    prefixIcon: Image.asset(
                      "assets/icons/ic_quran.png",
                      color: AppColors.white,
                    ),
                    hintText: "Sura Name",
                    hintStyle: TextStyle(
                      color: AppColors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: AppColors.gold),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: AppColors.gold),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: AppColors.gold),
                    ),
                  ),
                ),
              ),

              if (mostList.isNotEmpty)
                SizedBox(
                  height: 160,
                  child: ListView.separated(
                    itemCount: mostList.length,
                    separatorBuilder: (context, index) {
                      return SizedBox(width: 8);
                    },
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      int currentIndex = int.parse(mostList[index]);
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return QuranDetailsScreen(
                                  sura: SuraModel(
                                    id: (currentIndex + 1).toString(),
                                    verses: AppData.verses[currentIndex],
                                    suraNameAr: AppData.nameAr[currentIndex],
                                    suraNameEn: AppData.nameEn[currentIndex],
                                  ),
                                );
                              },
                            ),
                          );
                        },
                        child: Container(
                          padding: EdgeInsets.all(16),
                          height: 150,
                          decoration: BoxDecoration(
                            color: AppColors.gold,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    AppData.nameEn[currentIndex],
                                    style: TextStyle(
                                      color: AppColors.black,
                                      fontSize: 24,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  Text(
                                    AppData.nameAr[currentIndex],
                                    style: TextStyle(
                                      color: AppColors.black,
                                      fontSize: 24,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  Text(
                                    "${AppData.verses[currentIndex]} Verses",
                                    style: TextStyle(
                                      color: AppColors.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ],
                              ),
                              Image.asset("assets/images/most_image.png"),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              Expanded(
                child: ListView.separated(
                  padding: EdgeInsets.all(16),
                  separatorBuilder: (context, index) {
                    return Divider(height: 34, indent: 60, endIndent: 60);
                  },
                  itemCount: isSearch
                      ? searchIndex.length
                      : AppData.nameEn.length,
                  itemBuilder: (context, index) {
                    int currentIndex = isSearch ? searchIndex[index] : index;
                    return InkWell(
                      onTap: () {
                        saveSura(currentIndex.toString());
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return QuranDetailsScreen(
                                sura: SuraModel(
                                  id: (currentIndex + 1).toString(),
                                  verses: AppData.verses[currentIndex],
                                  suraNameAr: AppData.nameAr[currentIndex],
                                  suraNameEn: AppData.nameEn[currentIndex],
                                ),
                              );
                            },
                          ),
                        );
                      },
                      child: Row(
                        children: [
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              Image.asset(
                                "assets/images/img_sur_number_frame.png",
                                width: 52,
                              ),
                              Text(
                                (currentIndex + 1).toString(),
                                style: TextStyle(
                                  color: AppColors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(width: 12),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            spacing: 8,
                            children: [
                              Text(
                                AppData.nameEn[currentIndex],
                                style: TextStyle(
                                  color: AppColors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),

                              Text(
                                "${AppData.verses[currentIndex]} Verces",
                                style: TextStyle(
                                  color: AppColors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),

                          Expanded(
                            child: Text(
                              AppData.nameAr[currentIndex],
                              style: TextStyle(
                                color: AppColors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                              ),
                              textDirection: TextDirection.rtl,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void search(String q) {
    if (q.isEmpty) {
      isSearch = false;
      setState(() {});
      return;
    }
    isSearch = true;
    searchIndex = [];
    for (int i = 0; i < AppData.nameAr.length; i++) {
      if (AppData.nameAr[i].contains(q) ||
          AppData.nameEn[i].toLowerCase().contains(q.toLowerCase())) {
        searchIndex.add(i);
      }
    }
    setState(() {});
  }

  void saveSura(String id) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    mostList.add(id);
    await prefs.setStringList("most", mostList);
    setState(() {});
  }

  void getMost() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    mostList = prefs.getStringList("most") ?? [];
    setState(() {});
  }
}
