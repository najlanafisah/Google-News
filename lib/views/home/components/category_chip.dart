import 'package:flutter/material.dart';
import 'package:news_app/utils/app_colors.dart';

class CategoryChip extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const CategoryChip({super.key, required this.label, required this.isSelected, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 8),
      child: FilterChip(  // ini bawaan dari flutter biar ada pilihan category nya
        label: Text(label),
        selected: isSelected,
        onSelected: (_) => onTap(), // ini function privat inline
        backgroundColor: AppColors.background,
        selectedColor: AppColors.secondary.withValues(alpha: 0.2),
        checkmarkColor: AppColors.secondary,
        labelStyle: TextStyle(
          color: isSelected ? AppColors.secondary : AppColors.textPrimary,
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(
            color: isSelected ? AppColors.secondary : AppColors.textSecondary.withValues(alpha: .5)
          )
        ),
      ),
    );
  }
}