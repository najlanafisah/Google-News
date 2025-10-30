import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> openInBrowser(String? url) async {
  if (url == null) return;

  final Uri uri = Uri.parse(url);
    // proses menunggu apakah url valid dna bisa dibuka oleh browser
    if (await canLaunchUrl(uri)) {
    // proses menunggu ketia url sudah valid dan sedang di proses oleh browser sampai datanya muncul
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  } else {
    Get.snackbar(
      'Error',
      "Couldn't open the link",
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}
