import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami_project_flutter/core/theme/app_colors.dart';

import '../../hadeeth_details/screens/hadeeth_details_screens.dart';

class HadithScreen extends StatefulWidget {
  HadithScreen({super.key});

  @override
  State<HadithScreen> createState() => _HadithScreenState();
}

class _HadithScreenState extends State<HadithScreen> {
  List<HadethData> ahadeth = [];

  @override
  void initState() {
    readHadith();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage("assets/images/hadeeth_bg.png"),
        ),
      ),
      child: SafeArea(
        child: Column(
          children: [
            Center(
              child: Image.asset("assets/logo/islami_on_masgd.png", width: 300),
            ),
            Expanded(
              child: CarouselSlider.builder(
                itemCount: ahadeth.length,
                itemBuilder: (context, index, realIndex) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return HadeethDetailsScreens(
                              hadethData: ahadeth[index],
                            );
                          },
                        ),
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.only(top: 12, right: 12, left: 12),
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
                                  "assets/images/quran_details_left_corner.png",
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
                                  "assets/images/quran_details_right_corner.png",
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
                                    Expanded(
                                      child: Image.asset(
                                        "assets/images/carousel_slider_img.png",
                                      ),
                                    ),
                                    Image.asset(
                                      "assets/images/carousel_slider_footer.png",
                                      fit: BoxFit.cover,
                                    ),
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
                  height: 700,
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
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  void readHadith() async {
    for (int i = 1; i <= 50; i++) {
      String value = await rootBundle.loadString("assets/hadeeth/h$i.txt");
      value = value.trim();
      HadethData hadethData = HadethData(
        title: value.split("\n")[0],
        body: value.split("\n")[1],
      );
      ahadeth.add(hadethData);
    }
    setState(() {});
  }
}

class HadethData {
  String title;
  String body;

  HadethData({required this.title, required this.body});
}
