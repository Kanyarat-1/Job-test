import 'package:flutter_application_cinemax/app/modules/home/controllers/home_controller.dart';
import 'package:get/get.dart';

import '../controllers/detail_controller.dart';

class DetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailController>(
      () => DetailController(),
    );
    
    // สมมุติว่าได้
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
  }
}
