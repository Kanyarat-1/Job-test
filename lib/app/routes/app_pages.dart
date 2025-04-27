import 'package:get/get.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/detail/bindings/detail_binding.dart';
import '../modules/home/detail/views/detail_view.dart';
import '../modules/home/views/home_view.dart';
import '../modules/splashscreen/bindings/splashscreen_binding.dart';
import '../modules/splashscreen/views/splashscreen_view.dart';

part 'app_routes.dart';

class AppPages { 
  AppPages._();

  static const INITIAL = Routes.SPLASHSCREEN;
  
  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => SearchResultPage(),
      binding: HomeBinding(),
      children: [
        GetPage(
          name: _Paths.DETAIL,
          page: () => DetailPage(),
          binding: DetailBinding(),
        ),
      ],
    ),
    GetPage(
      name: _Paths.SPLASHSCREEN,
      page: () => const SplashscreenView(),
      binding: SplashscreenBinding(),
    ),
  ];
}
