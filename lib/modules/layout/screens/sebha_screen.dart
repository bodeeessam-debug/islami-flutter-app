import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami_project_flutter/core/theme/app_colors.dart';

class SebhaScreen extends StatefulWidget {
  const SebhaScreen({super.key});

  @override
  State<SebhaScreen> createState() => _SebhaScreenState();
}

class _SebhaScreenState extends State<SebhaScreen> {
  int count = 0;
  double turns = 0;
  final List<String> azkar = ["سبحان الله", "الحمد لله", "الله أكبر"];
  int currentZikrIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage("assets/images/sebha_bg.png")),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Center(
                child: Image.asset(
                  "assets/logo/islami_on_masgd.png",
                  width: 291.w,
                ),
              ),
              SizedBox(height: 16.h),
              Text(
                "سَبِّحِ اسْمَ رَبِّكَ الأعلى ",
                style: TextStyle(
                  fontSize: 36.sp,
                  fontWeight: FontWeight.w700,
                  color: AppColors.white,
                ),
              ),
              SizedBox(height: 16.h),
              Transform.translate(
                offset: Offset(30.w, 8.h),
                child: Image.asset(
                  "assets/images/sebha_head.png",
                  width: 73.w,
                  height: 86.h,
                ),
              ),
              InkWell(
                onTap: onSebhaTap,
                child: Stack(
                  alignment: AlignmentGeometry.center,
                  children: [
                    AnimatedRotation(
                      turns: turns,
                      duration: const Duration(milliseconds: 250),
                      curve: Curves.easeInOut,
                      child: Image.asset(
                        "assets/images/sebha_body.png",
                        width: 378.99995481967926.w,
                        fit: BoxFit.contain,
                      ),
                    ),
                    Column(
                      children: [
                        Text(
                          azkar[currentZikrIndex],
                          style: TextStyle(
                            fontSize: 36.sp,
                            fontWeight: FontWeight.w700,
                            color: AppColors.white,
                          ),
                        ),
                        SizedBox(height: 16.h),
                        Text(
                          "$count",
                          style: TextStyle(
                            fontSize: 36.sp,
                            fontWeight: FontWeight.w700,
                            color: AppColors.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onSebhaTap() {
    setState(() {
      count++;
      turns += 1 / 30; // 1 over 30 34an al homa 30 5arzh. fa 30 x (1 / 30)

      if (count == 33) {
        count = 0;
        currentZikrIndex++;

        if (currentZikrIndex >= azkar.length) {
          currentZikrIndex = 0;
        }
      }
    });
  }
}
