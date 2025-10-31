import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/controllers/news_controller.dart';
import 'package:news_app/routes/app_pages.dart';
import 'package:news_app/utils/app_colors.dart';
import 'package:news_app/views/headlines/components/headlines_card.dart';
import 'package:news_app/views/headlines/components/headlines_header.dart';
import 'package:news_app/views/headlines/components/loading_shimmer.dart';
import 'package:news_app/views/widgets/bottom_nav.dart';
import 'package:news_app/views/home/components/empty_state_widget.dart';
import 'package:news_app/views/home/components/error_state_widget.dart';

class HeadlinesScreen extends GetView<NewsController> {
  const HeadlinesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        if (controller.isLoading) {
          return const LoadingShimmerTopHeadlines();
        }
        if (controller.error.isNotEmpty) {
          return ErrorStateWidget(onRetry: controller.refreshNews);
        }
        if (controller.articles.isEmpty) {
          return const EmptyStateWidget();
        }

        return RefreshIndicator(
          onRefresh: controller.refreshNews,
          color: AppColors.textSecondary,
          backgroundColor: AppColors.background,
          child: ListView.builder(
            itemCount: controller.articles.length + 1,
            itemBuilder: (context, index) {
              if (index == 0) {
                return const HeadlinesHeader();
              }
              final article = controller.articles[index - 1];
              return HeadlinesCard(
                article: article,
                onTap: () => Get.toNamed(
                  Routes.NEWS_DETAIL,
                  arguments: article,
                ),
              );
            },
          ),
        );
      }),
      bottomNavigationBar: const BottomNav(selectedIndex: 1),
    );
  }
}
