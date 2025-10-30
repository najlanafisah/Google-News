import 'package:flutter/material.dart';
import 'package:news_app/utils/app_colors.dart';

class BottomNav extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onItemTapped;

  const BottomNav({super.key, required this.selectedIndex, required this.onItemTapped});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
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
      currentIndex: selectedIndex,
      selectedItemColor: AppColors.primary,
      onTap: onItemTapped,
    );
  }
}
