import 'package:flutter/material.dart';
import 'package:islami_project_flutter/core/theme/app_colors.dart';
import 'package:islami_project_flutter/modules/layout/screens/hadith_screen.dart';

class HadeethDetailsScreens extends StatelessWidget {
  HadethData hadethData;

  HadeethDetailsScreens({super.key, required this.hadethData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: AppBar(
        foregroundColor: AppColors.gold,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(hadethData.title),
      ),
      body: Padding(
        padding: EdgeInsetsGeometry.all(16),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Image.asset(
                    "assets/images/quran_details_left_corner.png",
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Center(
                    child: Text(
                      hadethData.title,
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
            SizedBox(height: 16),
            Expanded(
              child: Text(
                hadethData.body,
                style: TextStyle(fontSize: 18, color: AppColors.gold),
                textDirection: TextDirection.rtl,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
