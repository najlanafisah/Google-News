import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:news_app/bindings/app_bindings.dart';
import 'package:news_app/routes/app_pages.dart';
import 'package:news_app/utils/app_colors.dart';
import 'package:intl/date_symbol_data_local.dart';


void main() async { // ini async karena dia mengambil data dari internet
  WidgetsFlutterBinding.ensureInitialized();

  // load environment variables first before runing the app
  await dotenv.load(fileName: '.env'); // ini .env dipanggil sebelum di running = karena di sana tersimpan API KEY dan kita gabakal bisa ngambil data kalo gaada API KEY

  await initializeDateFormatting('id_ID', null);

  runApp(GoogleNewsApp());
}
 class GoogleNewsApp extends StatelessWidget {
  const GoogleNewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Google News App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: AppColors.primary,
        scaffoldBackgroundColor: AppColors.background,
        appBarTheme: AppBarTheme(
          backgroundColor: AppColors.primary,
          foregroundColor: AppColors.background,
          elevation: 0
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.button,
            foregroundColor: AppColors.background
          )
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: AppColors.background
        )
      ),
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      defaultTransition: Transition.fadeIn,
      initialBinding: AppBindings(),
      debugShowCheckedModeBanner: false,
    );
  }
}