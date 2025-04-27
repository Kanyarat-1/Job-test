import 'package:flutter_application_cinemax/app/data/models/api_model.dart';
import 'package:flutter_application_cinemax/app/data/providers/api_provider.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final isLoading = true.obs;
  final allMovie = <Api>[].obs; // หนังทั้งหมด
  final foundMovie = <Api>[].obs; // หนังที่ได้จากการค้นหา
  final searchMovie = ''.obs; // ค่าที่ค้นหา


  @override
  void onInit() {
    fetchMoveie();
    super.onInit();
  }

  void fetchMoveie() async {
    try {
      var result = await Get.find<ApiProvider>().getApi();
      allMovie.clear();
      allMovie.addAll(result);
      foundMovie.value = allMovie;
    } finally {
      isLoading(false);
    }
  }

  @override
  void onClose() {}
  void filterMovie(String input) {
    List<Api> results =
        []; // ประกาศตัวแปร results ให้เป็น Array โดยมีโครงสร้างแบบ List<Api>
    if (input.isEmpty) {
      // ถ้า movieName ไม่มีค่าจะให้ค่าเริ่มต้นเหมือนกับ allMovie
      results = allMovie;
    } else {
      results = allMovie
          .where((element) => element.movie
              .toString()
              .toLowerCase()
              .contains(input.toLowerCase()))
          .toList();
    }
    foundMovie.value = results;
  }

  void clearSearch() {
    searchMovie.value = "";
    filterMovie('');
  }

  
}
