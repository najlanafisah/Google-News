//  A brand new way for make a sreen using get state management

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/controllers/news_controller.dart';
import 'package:news_app/routes/app_pages.dart';
import 'package:news_app/views/home/components/bottom_nav.dart';
import 'package:news_app/views/home/components/category_chip.dart';
import 'package:news_app/views/home/components/empty_state_widget.dart';
import 'package:news_app/views/home/components/error_state_widget.dart';
import 'package:news_app/views/home/components/home_header.dart';
import 'package:news_app/views/home/components/loading_shimmer.dart';
import 'package:news_app/views/home/components/news_card.dart';

class HomeScreen extends GetView<NewsController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    int selectedIndex = 0;
    return Scaffold(
      body: Column(
        children: [
          HomeHeader(),
          SizedBox(
            height: 60,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              itemCount: controller.categories.length,
              itemBuilder: (context, index) {
                final category = controller.categories[index];
                return Obx(
                  () => CategoryChip(
                    label: category.capitalize ?? category,
                    isSelected:
                        controller.selectedCategory ==
                        category, // kalo dia kelipih dia bakal menampilkan category yang kepilih dan memilah datanya
                    onTap: () => controller.selectCategory(category),
                  ),
                );
              },
            ),
          ),

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
                return const EmptyStateWidget();
              }

              return RefreshIndicator(
                onRefresh: controller.refreshNews,
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
      // di sini bagian bottom nav-nya
      bottomNavigationBar: BottomNav(
        selectedIndex: selectedIndex,
        onItemTapped: (index) {
          // sementara cuma ganti print aja, biar nanti bisa dikembangin
          debugPrint('Kamu tap index ke-$index');
        },
      ),
    );
  }
}
