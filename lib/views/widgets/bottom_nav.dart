import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/routes/app_pages.dart';
import 'package:news_app/utils/app_colors.dart';

class BottomNav extends StatelessWidget {
  final int selectedIndex;

  const BottomNav({super.key, required this.selectedIndex});

  void _onItemTapped(int index) {
    if (index == selectedIndex) return; // biar gak reload page yang sama

    switch (index) {
      case 0:
        Get.offAllNamed(Routes.HOME);
        break;
      case 1:
        Get.offAllNamed(
          '/headlines',
        );
        break;
      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: AppColors.divider, 
            width: 1,
          ),
        ),
      ),
      child: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: selectedIndex,
        selectedItemColor: AppColors.primary,
        unselectedItemColor: AppColors.textHint,
        backgroundColor: AppColors.background,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: "For You",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.language),
            label: "Headlines",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star_border),
            label: "Following",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.auto_stories),
            label: "Newsstand",
          ),
        ],
      ),
    );
  }
}
