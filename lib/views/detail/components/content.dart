import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/models/news_articles,.dart';
import 'package:news_app/utils/app_colors.dart';
import 'package:news_app/utils/url_utils.dart';
import 'package:timeago/timeago.dart' as timeago;

class Content extends StatelessWidget {
  final NewsArticles article = Get.arguments as NewsArticles;

  Content({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // source and date
            Row(
              children: [
                if (article.source?.name != null) ...[
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: AppColors.primary.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      article.source!.name!,
                      style: TextStyle(
                        color: AppColors.primary,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(width: 12),
                ],
                if (article.publishedAt != null) ...[
                  Text(
                    timeago.format(DateTime.parse(article.publishedAt!)),
                    style: TextStyle(
                      color: AppColors.textSecondary,
                      fontSize: 12,
                    ),
                  ),
                ],
              ],
            ),
            SizedBox(height: 16),

            // title
            if (article.title != null) ...[
              Text(
                article.title!,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                  height: 1.3,
                ),
              ),
              SizedBox(height: 16),
            ],

            // description
            if (article.description != null) ...[
              Text(
                article.description!,
                style: TextStyle(
                  color: AppColors.textSecondary,
                  fontSize: 16,
                  height: 1.5,
                ),
              ),
            ],
            SizedBox(height: 20),

            // Content
            if (article.content != null) ...[
              Text(
                'Content',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
              ),
              SizedBox(height: 8),
              Text(
                article.content!,
                style: TextStyle(
                  fontSize: 16,
                  color: AppColors.textPrimary,
                  height: 1.6,
                ),
              ),
              SizedBox(height: 24), // untuk jarak antara konten ke button
            ],

            // Read full article button
            if (article.url != null) ...[
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => openInBrowser(article.url),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                  child: Text(
                    'Read Full Article',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ],
            SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

}
