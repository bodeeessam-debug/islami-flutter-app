import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/app_colors.dart';

class DotIndicator extends StatelessWidget {
  final bool isSelected;

  const DotIndicator({super.key, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 6.w),
      width: isSelected ? 17.w : 7.w,
      height: 7.h,
      decoration: BoxDecoration(
        color: isSelected ? AppColors.gold : Colors.grey,
        borderRadius: BorderRadius.circular(20.r),
      ),
    );
  }
}
