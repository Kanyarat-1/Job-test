import 'package:flutter/material.dart';
import 'package:flutter_application_cinemax/app/widget/colors.dart';

import 'package:get/get.dart';

import '../controllers/splashscreen_controller.dart';

class SplashscreenView extends GetView<SplashscreenController> {
  const SplashscreenView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: background,
        body: Center(
          child: GestureDetector(
              onTap: () => Get.offAllNamed('/home'),
              child: Image.network(
                  'https://assets.apk.live/com.maximillianleonov.cinemax--7-post.png')),
        ));
  }
}
