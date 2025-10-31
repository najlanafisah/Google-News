//  A brand new way for make a sreen using get state management

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/controllers/news_controller.dart';
import 'package:news_app/routes/app_pages.dart';
import 'package:news_app/utils/app_colors.dart';
import 'package:news_app/views/widgets/bottom_nav.dart';
import 'package:news_app/views/home/components/empty_state_widget.dart';
import 'package:news_app/views/home/components/error_state_widget.dart';
import 'package:news_app/views/home/components/home_header.dart';
import 'package:news_app/views/home/components/loading_shimmer.dart';
import 'package:news_app/views/home/components/news_card.dart';

class HomeScreen extends GetView<NewsController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          HomeHeader(),
          // News List
          Expanded(
            child: Obx(() {
              if (controller.isLoading) {
                // biar nanti kalo lagi loading update/fetching data, dia muncul loading shimmer
                return LoadingShimmer();
              }
              if (controller.error.isNotEmpty) {
                // klo controllernya error tapi ada datanya
                return ErrorStateWidget(onRetry: controller.refreshNews);
              }

              if (controller.articles.isEmpty) {
                // kalo controllernya kosong/datanya gaada
                return EmptyStateWidget();
              }

              return RefreshIndicator(
                onRefresh: controller.refreshNews,
                color: AppColors.textSecondary, // warna lingkaran spinner
                backgroundColor: AppColors.background,
                child: ListView.builder(
                  padding: EdgeInsets.all(1),
                  itemCount: controller.articles.length,
                  itemBuilder: (context, index) {
                    final article = controller.articles[index];
                    return NewsCard(
                      article: article,
                      onTap: () => Get.toNamed(
                        Routes.NEWS_DETAIL,
                        arguments:
                            article, // argumen berfungsi untuk bernavigasi ke halaman lain dengan membawa berita
                      ),
                    );
                  },
                ),
              );
            }),
          ), // untuk memenuhi ruang kosong yang ada
          SizedBox(height: 8),
        ],
      ),
      bottomNavigationBar: BottomNav(selectedIndex: 0),
    );
  }
}
