import 'package:flutter/services.dart';
import 'package:get/get.dart';

void copyLink(String? text) {
  if (text == null) return;
  Clipboard.setData(ClipboardData(text: text));
  Get.snackbar(
    'Success',
    'Link copied to clipboard',
    snackPosition: SnackPosition.BOTTOM,
    duration: const Duration(seconds: 2),
  );
}
