import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami_project_flutter/core/theme/app_colors.dart';

import '../../layout/screens/layout_screen.dart';
import '../../onboarding/screens/onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) {
            return OnboardingScreen();
          },
        ),
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: AlignmentGeometry.topCenter,
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/splash_background.png',
              fit: BoxFit.cover,
            ),
          ),
          Image.asset(
            'assets/images/masgd_background.png',
            width: 291.w,
            height: 157.h,
          ),

          Center(
            child: Image.asset(
              'assets/logo/masgd_splash_islami.png',
              width: 173.71591186523438.w,
              height: 232.h,
            ),
          ),
          SafeArea(
            child: Align(
              alignment: AlignmentGeometry.bottomCenter,
              child: Image.asset(
                'assets/logo/img_branding.png',
                width: 244.w,
                height: 108.h,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
