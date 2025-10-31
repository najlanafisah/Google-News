import 'package:flutter/material.dart';
import 'package:news_app/utils/app_colors.dart';

class ErrorStateWidget extends StatelessWidget {
  final VoidCallback onRetry;

  const ErrorStateWidget({super.key, required this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Something went wrong',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Please check your internet connection',
            style: TextStyle(color: AppColors.textSecondary),
          ),
          SizedBox(height: 24),
          Image.asset('no-internet.png', height: 260),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: onRetry,
            child: Row(
              mainAxisSize:
                  MainAxisSize.min,
              children: [
                Icon(Icons.refresh),
                SizedBox(width: 8),
                Text('Try Again'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
