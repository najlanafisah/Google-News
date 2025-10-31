import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/models/news_articles,.dart';
import 'package:news_app/utils/app_colors.dart';
import 'package:news_app/utils/copy_link_utils.dart';
import 'package:news_app/utils/share_utis.dart';
import 'package:news_app/utils/url_utils.dart';

class ImageAppBar extends StatefulWidget {
  final NewsArticles article = Get.arguments as NewsArticles;

  ImageAppBar({super.key});

  @override
  State<ImageAppBar> createState() => _ImageAppBarState();
}

class _ImageAppBarState extends State<ImageAppBar> {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 300,
            pinned: true, // kalo di scroll appbarnya ttp ada
            flexibleSpace: FlexibleSpaceBar(
              background: widget.article.urlToImage != null
                  ? CachedNetworkImage( // Ini bakal bikin semua size gambarnya sama, karaena biasanya beda2, jadi disamain
                      imageUrl: widget.article.urlToImage!,
                      fit: BoxFit.cover, // agar menutupi seluruh bagian dari appbar
                      placeholder: (context, url) => Container(
                        color: AppColors.divider,
                        child: Center(
                          child: CircularProgressIndicator(), // untuk loading kalo belom muncul gambarnya
                        ),
                      ),

                      errorWidget: (context, url, error) => Container( // ini kalo gambarnya ga support png dan jpg (misal dia svg dll) bakal muncul icon ini
                        color: AppColors.divider,
                        child: Icon(
                          Icons.image_not_supported,
                          size: 50,
                          color: AppColors.textHint,
                          ),
                      ),
                  )
                  
                : Container( // satement yang akan dijalankan ketika server tidak memiliki gambar/imaage == null
                  color: AppColors.divider,
                  child: Icon(
                    Icons.newspaper,
                    size: 50,
                    color: AppColors.textHint
                  ),
                )
            ),
            actions: [
              IconButton(
                icon: Icon(
                  Icons.share,
                ),
                onPressed: () => shareArticle(widget.article.title ,widget.article.url)
              ),
              PopupMenuButton(
                onSelected: (value) {
                  switch (value) {
                    case 'copy_link':
                      copyLink(widget.article.url);
                      break;
                    case 'open_browser':
                      openInBrowser(widget.article.url);
                    break;
                  }
                },
                itemBuilder: (context) => [  // ini yang nanti muncul dropdown copy link dan open browser
                  PopupMenuItem(
                    value: 'copy_link',
                    child: Row(
                      children: [
                        Icon(Icons.copy, color: AppColors.textSecondary,),
                        SizedBox(width: 8),
                        Text('Copy Link')
                      ],
                    ),
                  ),
                  PopupMenuItem(
                    value: 'open_browser',
                    child: Row(
                      children: [
                        Icon(Icons.open_in_browser, color: AppColors.textSecondary,),
                        SizedBox(width: 8),  // ini bisa jadi error
                        Text('Open in Browser')
                      ],
                    ),
                  )                
                ],
              )
            ],
    );
  }
}