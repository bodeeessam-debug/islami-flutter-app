import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami_project_flutter/core/app_data/app_data.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/theme/app_colors.dart';
import '../../quran_details/screens/quran_details_screen.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<int> searchIndex = [];
  List<String> mostList = [];
  bool isSearch = false;

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
          image: AssetImage("assets/images/home_background.png"),
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

        child: Column(
          children: [
            Center(
              child: Image.asset(
                "assets/logo/islami_on_masgd.png",
                width: 299.w,
                height: 141.h,
              ),
            ),

            if (mostList.isNotEmpty)
              SizedBox(
                height: 130,
                child: ListView.builder(
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
                                suraModel: SuraModel(
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
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        padding: EdgeInsets.all(16),
                        height: 100,
                        decoration: BoxDecoration(
                          color: AppColors.gold,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  AppData.nameEn[currentIndex],
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 24,
                                  ),
                                ),
                                Text(
                                  AppData.nameAr[currentIndex],
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 24,
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
                            Image.asset("assets/images/recently_used.png"),
                          ],
                        ),
                      ),
                    );
                  },
                  itemCount: mostList.length,
                ),
              ),

            Padding(
              padding: const EdgeInsets.all(16),
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: Transform.scale(
                    scale: 0.6,
                    child: Image.asset(
                      "assets/icons/quran.png",
                      width: 20,
                      height: 28,
                      color: AppColors.gold,
                    ),
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
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
                onChanged: (value) {
                  searchSura(value);
                },
              ),
            ),

            Expanded(
              child: ListView.separated(
                separatorBuilder: (context, index) {
                  return Divider(
                    height: 24,
                    color: AppColors.white,
                    indent: 45,
                    endIndent: 45,
                  );
                },
                padding: EdgeInsets.all(21),
                itemCount: isSearch
                    ? searchIndex.length
                    : AppData.nameAr.length,
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
                              suraModel: SuraModel(
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
                      spacing: 20,
                      children: [
                        Stack(
                          alignment: AlignmentGeometry.center,
                          children: [
                            Image.asset(
                              "assets/images/container.png",
                              width: 52,
                            ),
                            Text(
                              (index + 1).toString(),
                              style: TextStyle(
                                color: AppColors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          spacing: 4,
                          crossAxisAlignment: CrossAxisAlignment.start,
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
                              AppData.verses[currentIndex] + " verses",
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
                            textDirection: TextDirection.rtl,
                            AppData.nameAr[currentIndex],
                            style: TextStyle(
                              color: AppColors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                            ),
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
    );
  }

  void searchSura(String q) {
    if (q.isEmpty) {
      isSearch = false;
      setState(() {});
      return;
    }

    isSearch = true;
    searchIndex = [];
    for (int i = 0; i < AppData.nameAr.length; i++) {
      if (AppData.nameEn[i].toLowerCase().contains(q.toLowerCase()) ||
          AppData.nameAr[i].contains(q)) {
        searchIndex.add(i);
      }
    }
    setState(() {});
  }

  void saveSura(String id) async {
    final prefs = await SharedPreferences.getInstance();

    mostList.remove(id);
    mostList.insert(0, id);

    await prefs.setStringList("most", mostList);

    setState(() {});
  }

  void getMost() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    mostList = await prefs.getStringList("most") ?? [];
    setState(() {});
  }
}
