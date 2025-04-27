import 'package:flutter/material.dart';
import 'package:flutter_application_cinemax/app/modules/home/detail/views/detail_view.dart';
import 'package:flutter_application_cinemax/app/widget/colors.dart';
import 'package:flutter_application_cinemax/app/widget/custom_icon.dart';
import 'package:flutter_application_cinemax/app/widget/label.dart';

import 'package:get/get.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../controllers/home_controller.dart';

class SearchResultPage extends StatelessWidget {
  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: background,
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 40, left: 16, right: 16),
              child: Row(
                children: [
                  Expanded(
                    child: Obx(() {
                      return TextField(
                        controller: TextEditingController(text: controller.searchMovie.value),
                        onChanged: (value) {
                          controller.filterMovie(value);
                        },
                        
                        style: const TextStyle(color: textname),
                        decoration: InputDecoration(
                          prefixIcon: const Icon(LucideIcons.search,
                              color: textdetail, size: 16),
                          filled: true,
                          fillColor: boxsearch,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(24),
                            borderSide: BorderSide.none,
                          ),
                          contentPadding: EdgeInsets.symmetric(vertical: 0),
                        ),
                      );
                    }),
                  ),
                  SizedBox(width: 8),
                  TextButton(
                    onPressed: controller.clearSearch,
                    child: const Text(
                      'Cancle',
                      style: TextStyle(color: textdetail),
                    ),
                  ),
                ],
              ),
            ),

            Expanded(
              child: Obx(() {
                if (controller.isLoading.value) {
                  return const Center(child: CircularProgressIndicator(color: label));
                }

                return ListView.builder(
                  itemCount: controller.foundMovie.length,
                  itemBuilder: (context, index) {
                    final movie = controller.foundMovie[index];
                    return Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Get.to(const DetailPage(), arguments: movie);
                            },
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.network(
                                    '${movie.poster}',
                                    width: 112,
                                    height: 147,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                SizedBox(width: 24),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Teg(),
                                      SizedBox(height: 8),
                                      Text(
                                        '${movie.movie}',
                                        style: const TextStyle(
                                            color: textname,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      SizedBox(height: 8),
                                      Row(
                                        children: [
                                          CalendarIcon(),
                                          SizedBox(width: 8),
                                          Text(
                                            '${movie.year}',
                                            style: const TextStyle(
                                                color: textdetail),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 8),
                                      Row(
                                        children: [
                                          ClockIcon(),
                                          SizedBox(width: 8),
                                          Text(
                                            '${movie.movieDuration}',
                                            style: const TextStyle(
                                                color: textdetail),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              }),
            ),
          ],
        ));
  }
}
