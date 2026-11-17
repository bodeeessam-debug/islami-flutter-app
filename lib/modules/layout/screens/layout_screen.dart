import 'package:flutter/material.dart';
import 'package:islami_project_flutter/core/theme/app_colors.dart';
import 'package:islami_project_flutter/modules/layout/screens/hadith_screen.dart';
import 'package:islami_project_flutter/modules/layout/screens/home_screen.dart';
import 'package:islami_project_flutter/modules/layout/screens/radio_screen.dart';
import 'package:islami_project_flutter/modules/layout/screens/sebha_screen.dart';
import 'package:islami_project_flutter/modules/layout/screens/time_screen.dart';

class LayoutScreen extends StatefulWidget {
  const LayoutScreen({super.key});

  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {
  int index = 0;
  List<Widget> screens = [
    HomeScreen(),
    HadithScreen(),
    SebhaScreen(),
    RadioScreen(),
    TimeScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[index],
      backgroundColor: AppColors.black,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        onTap: (value) {
          setState(() {
            index = value;
          });
        },
        type: BottomNavigationBarType.fixed,
        backgroundColor: AppColors.gold,
        selectedItemColor: AppColors.white,
        //->> al color bta3 al labels
        unselectedItemColor: AppColors.black,
        showSelectedLabels: true,
        showUnselectedLabels: false,

        items: [
          btnNavItem(label: "Quran", icon: "assets/icons/quran.png"),
          btnNavItem(label: "Hadith", icon: "assets/icons/book.png"),
          btnNavItem(label: "Sebha", icon: "assets/icons/sibha.png"),
          btnNavItem(label: "Radio", icon: "assets/icons/radio.png"),
          btnNavItem(label: "Time", icon: "assets/icons/time.png"),
        ],
      ),
    );
  }

  BottomNavigationBarItem btnNavItem({
    required String label,
    required String icon,
  }) {
    return BottomNavigationBarItem(
      icon: Image.asset(icon, height: 24, color: AppColors.black),
      label: label,
      activeIcon: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: AppColors.black.withValues(alpha: 0.6),
        ),
        child: Image.asset(icon, height: 24, color: AppColors.white),
      ),
    );
  }
}
