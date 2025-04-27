import 'package:flutter/material.dart';
import 'package:flutter_application_cinemax/app/data/models/api_model.dart';
import 'package:flutter_application_cinemax/app/widget/colors.dart';
import 'package:flutter_application_cinemax/app/widget/custom_icon.dart';

import 'package:get/get.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../controllers/detail_controller.dart';

class DetailPage extends GetView<DetailController> {
  const DetailPage({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    final whoa = Get.arguments as Api;

    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        backgroundColor: background,
        leading: IconButton(
          icon: Icon(LucideIcons.chevronLeft, color: textname),
          onPressed: () {
            Get.back();
          },
        ),
        title: Text(
          '${whoa.movie}',
          style: const TextStyle(
            color: textname, 
            fontSize: 18,
            fontWeight: FontWeight.w600
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 24),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  '${whoa.poster}',
                  width: 250,
                  height: 350,
                  fit: BoxFit.fill,
                ),
              ),
              const SizedBox(height: 16),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      const CalendarIcon(),
                      const SizedBox(width: 8),
                      Text(
                        '${whoa.year}',
                        style: const TextStyle(
                          color: textdetail,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 18),
                  const Text(
                    '|',
                    style: TextStyle(
                      color: textdetail,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(width: 18),
                  Row(
                    children: [
                      const ClockIcon(),
                      const SizedBox(width: 8),
                      Text(
                        '${whoa.movieDuration}',
                        style: const TextStyle(
                          color: textdetail,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              const SizedBox(height: 24),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Director: ${whoa.director}',
                      style: const TextStyle(
                        color: textdetail,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),

                    Text(
                      'Character: ${whoa.character}',
                      style: const TextStyle(
                        color: textdetail,
                        fontSize: 16,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}