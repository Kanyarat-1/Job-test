import 'package:flutter_application_cinemax/app/services/providers/api_provider.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.lazyPut<ApiProvider>(
      () => ApiProvider(),
    );
  }
}
