import 'package:share_plus/share_plus.dart';

void shareArticle(String? title, String? url) {
  if (url == null) return;
  Share.share(
    '${title ?? 'Check out this news'}\n\n$url',
    subject: title,
  );
}
