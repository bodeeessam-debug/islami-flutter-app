import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami_project_flutter/core/theme/app_colors.dart';
import 'package:islami_project_flutter/modules/onboarding/widgets/dot_indicator/dot_indicator.dart';
import 'package:provider/provider.dart';

import '../../../core/provider/onboarding_provider/onboarding_provider.dart';
import '../../layout/screens/layout_screen.dart';
import '../models/onboarding_model.dart';
import '../widgets/onboarding_page/OnboardingPage.dart';

class OnboardingScreen extends StatelessWidget {
  OnboardingScreen({super.key});

  List<OnboardingModel> onboardingPages = [
    OnboardingModel(
      imagePath: 'assets/images/onboarding_1.png',
      title: 'Welcome To Islami App',
    ),

    OnboardingModel(
      imagePath: 'assets/images/onboarding_2.png',
      title: 'Welcome To Islami',
      description: 'We Are Very Excited To Have You In Our Community',
    ),

    OnboardingModel(
      imagePath: 'assets/images/onboarding_3.png',
      title: 'Reading the Quran',
      description: 'Read, and your Lord is the Most Generous',
    ),

    OnboardingModel(
      imagePath: 'assets/images/onboarding_4.png',
      title: 'Bearish',
      description: 'Praise the name of your Lord, the Most High',
    ),

    OnboardingModel(
      imagePath: 'assets/images/onboarding_5.png',
      title: 'Holy Quran Radio',
      description:
      'You can listen to the Holy Quran Radio through the application for free and easily',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => OnboardingProvider(),

      builder: (context, child) {
        var provider = Provider.of<OnboardingProvider>(context);
        return Scaffold(
          backgroundColor: AppColors.black,
          body: SafeArea(
            child: Column(
              children: [
                Image.asset(
                  "assets/logo/islami_on_masgd.png",
                  width: 291.w,
                  height: 171.h,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                      child: PageView.builder(
                      controller: provider.pageController,
                      onPageChanged: provider.onPageChanged,
                        itemCount: onboardingPages.length,

                        itemBuilder: (context, index) {
                          final page = onboardingPages[index];

                          return OnboardingPage(
                            imagePath: page.imagePath,
                            title: page.title,
                            description: page.description,
                          );
                        },
                      )
                  ),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      style: TextButton.styleFrom(
                        foregroundColor: AppColors.gold,
                      ),
                      onPressed: provider.currentPage == 0
                          ? null
                          : provider.previousPage,
                      child: const Text('Back'),
                    ),

                    // Indicators Row
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: List.generate(provider.totalPages, (index) {
                        bool isSelected = provider.currentPage == index;

                        return DotIndicator(isSelected: isSelected);
                      }),
                    ),

                    TextButton(
                      style: TextButton.styleFrom(
                        foregroundColor: AppColors.gold,
                      ),
                      onPressed: () {
                        if (provider.currentPage == provider.totalPages - 1) {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const LayoutScreen(),
                            ),
                          );
                        } else {
                          provider.nextPage();
                        }
                      },
                      child: Text(
                        provider.currentPage == provider.totalPages - 1
                            ? 'Finish'
                            : 'Next',
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
