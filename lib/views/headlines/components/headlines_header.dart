import 'package:flutter/material.dart';
import 'package:news_app/utils/app_colors.dart';

class HeadlinesHeader extends StatelessWidget {
  const HeadlinesHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 32, horizontal: 16),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Top Headlines',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primary,
                  ),
                ),
              ),
              SizedBox(height: 24),
              Divider(height: 1, thickness: 1),
            ],
          ),
        ),
      ],
    );
  }
}
