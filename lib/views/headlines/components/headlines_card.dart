import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/models/news_articles,.dart';
import 'package:news_app/utils/app_colors.dart';
import 'package:news_app/utils/copy_link_utils.dart';
import 'package:news_app/utils/share_utis.dart';
import 'package:news_app/utils/url_utils.dart';
import 'package:timeago/timeago.dart' as timeago;

class HeadlinesCard extends StatelessWidget {
  final NewsArticles article;
  final VoidCallback onTap;

  const HeadlinesCard({super.key, required this.article, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      // InkWell adalah animasi untuk menampilkan objek yang ada dallam card biar di match sama shimmer, intinya biar satu kesatuan dari gambar dan animasinya, biar smooth
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (article.source?.name != null) ...[
                        Text(
                          article.source!.name!,
                          style: TextStyle(
                            color: AppColors.textSecondary,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                      SizedBox(height: 8),
                      if (article.title != null)
                        Text(
                          article.title!,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: AppColors.textPrimary,
                            height: 1.3,
                          ),
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                    ],
                  ),
                ),

                SizedBox(width: 10),
                // image
                if (article.urlToImage != null)
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: CachedNetworkImage(
                      imageUrl: article.urlToImage!,
                      height: 100,
                      width: 100,
                      fit: BoxFit.cover,
                      placeholder: (context, url) => Container(
                        // ini biar kalo misal gaada gambarnya nanati kyk ada gambar terus retak gitu biar maksudnya gambarnya gaada
                        height: 200,
                        color: AppColors.divider,
                        child: Center(child: CircularProgressIndicator()),
                      ),
                      // membuat error widget (untuk image)
                      errorWidget: (context, url, error) => Container(
                        height: 200,
                        color: AppColors.divider,
                        child: Center(
                          child: Icon(
                            Icons.image_not_supported,
                            size: 40,
                            color: AppColors.textHint,
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (article.publishedAt != null)
                  Text(
                    timeago.format(DateTime.parse(article.publishedAt!)),
                    style: TextStyle(
                      color: AppColors.textSecondary,
                      fontSize: 12,
                    ),
                  ),
                PopupMenuButton(
                  color: AppColors.background,
                  onSelected: (value) {
                    switch (value) {
                      case 'copy_link':
                        copyLink(article.url);
                        break;
                      case 'open_browser':
                        openInBrowser(article.url);
                      case 'share_article':
                        shareArticle(article.url, article.title);
                        break;
                    }
                  },
                  itemBuilder: (context) => [
                    // ini yang nanti muncul dropdown copy link dan open browser
                    PopupMenuItem(
                      value: 'copy_link',
                      child: Row(
                        children: [
                          Icon(Icons.copy, color: AppColors.textSecondary),
                          SizedBox(width: 8),
                          Text('Copy Link'),
                        ],
                      ),
                    ),
                    PopupMenuItem(
                      value: 'open_browser',
                      child: Row(
                        children: [
                          Icon(
                            Icons.open_in_browser,
                            color: AppColors.textSecondary,
                          ),
                          SizedBox(width: 8), // ini bisa jadi error
                          Text('Open in Browser'),
                        ],
                      ),
                    ),
                    PopupMenuItem(
                      value: 'share_article',
                      child: Row(
                        children: [
                          Icon(
                            Icons.open_in_browser,
                            color: AppColors.textSecondary,
                          ),
                          SizedBox(width: 8), // ini bisa jadi error
                          Text('Share Article'),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 16),
            Divider(thickness: 1, height: 1),
          ],
        ),
      ),
    );
  }
}
