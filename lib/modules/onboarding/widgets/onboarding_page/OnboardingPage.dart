import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/app_colors.dart';

class OnboardingPage extends StatelessWidget {
  final String imagePath;
  final String title;
  final String? description;

  const OnboardingPage({
    super.key,
    required this.imagePath,
    required this.title,
    this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          imagePath,
          width: 387.w,
          height: 415.h,
          color: AppColors.gold,
        ),

        SizedBox(height: description == null ? 117.53.h : 41.h),
        Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: AppColors.gold,
            fontWeight: FontWeight.w700,
            fontSize: 24.sp,
          ),
        ),
        if (description != null) ...[
          SizedBox(height: 41.25.h),
          Text(
            description!,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.gold,
              fontWeight: FontWeight.w700,
              fontSize: 20.sp,
            ),
          ),
        ],
      ],
    );
  }
}
