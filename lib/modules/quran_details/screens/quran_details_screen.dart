import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/theme/app_colors.dart';

class QuranDetailsScreen extends StatefulWidget {
  SuraModel suraModel;

  QuranDetailsScreen({super.key, required this.suraModel});

  @override
  State<QuranDetailsScreen> createState() => _QuranDetailsScreenState();
}

class _QuranDetailsScreenState extends State<QuranDetailsScreen> {
  List<String> suraList = [];

  @override
  Widget build(BuildContext context) {
    if (suraList.isEmpty) {
      readFile(widget.suraModel.id);
    }
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: AppColors.gold,
        title: Text(widget.suraModel.suraNameEn),
        centerTitle: true,
        surfaceTintColor: Colors.transparent,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: 12, right: 12, left: 12),
          child: Stack(
            children: [
              Positioned(
                bottom: 0,
                child: Image.asset(
                  "assets/images/carousel_slider_footer.png",
                  width: 400,
                  fit: BoxFit.contain,
                ),
              ),
              Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Image.asset(
                          "assets/images/quran_details_left_corner.png",
                        ),
                      ),
                      Expanded(
                        child: Center(
                          child: Text(
                            widget.suraModel.suraNameAr,
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w700,
                              color: AppColors.gold,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Image.asset(
                          "assets/images/quran_details_right_corner.png",
                        ),
                      ),
                    ],
                  ),

                  Expanded(
                    child: SingleChildScrollView(
                      child: Text.rich(
                        textDirection: TextDirection.rtl,
                        TextSpan(
                          children: suraList.map((e) {
                            int index = suraList.indexOf(e);
                            return TextSpan(
                              text: "$e[${index + 1}] ",
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  showModalBottomSheet(
                                    context: context,
                                    builder: (context) {
                                      return Center(child: Text(e));
                                    },
                                  );
                                },
                              style: TextStyle(
                                fontSize: 20,
                                color: AppColors.gold,
                                fontWeight: FontWeight.w700,
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ),

                  // Expanded(
                  //   child: ListView.builder(
                  //     itemCount: suraList.length,
                  //     itemBuilder: (context, index) {
                  //       return Container(
                  //         margin: EdgeInsets.all(8),
                  //         padding: EdgeInsets.all(16),
                  //         width: 392,
                  //         decoration: BoxDecoration(
                  //           border: Border.all(color: AppColors.gold, width: 2),
                  //           borderRadius: BorderRadius.circular(15),
                  //         ),
                  //         child: Center(
                  //           child: Text(
                  //             textDirection: TextDirection.rtl,
                  //             suraList[index] +"[${index+1}]",
                  //             style: TextStyle(
                  //               fontSize: 20,
                  //               color: AppColors.gold,
                  //               fontWeight: FontWeight.w700,
                  //             ),
                  //           ),
                  //         ),
                  //       );
                  //     },
                  //   ),
                  // ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void readFile(String id) async {
    var sura = await rootBundle.loadString("assets/suras/$id.txt");
    sura = sura
        .trim(); //trim --> ya3ny yms7 al msafat mn al a5er w awl al string.
    suraList = sura.split("\n");
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
