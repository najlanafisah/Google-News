import 'package:get/get.dart';
import 'package:news_app/bindings/home_bindings.dart';
import 'package:news_app/views/news_detail_screen.dart';
import 'package:news_app/views/home/home_screen.dart';
import 'package:news_app/views/splash_screen.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.SPLASH,
      page: () => SplashScreen()
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => HomeScreen(),
      binding: HomeBindings() // untuk memanggil smeua yang ada di controller
    ),
    GetPage(
      name: _Paths.NEWS_DETAIL,
      page: () => NewsDetailScreen()
    )
  ];
}