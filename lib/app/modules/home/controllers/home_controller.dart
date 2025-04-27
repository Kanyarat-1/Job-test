import 'package:flutter_application_cinemax/app/services/models/api_model.dart';
import 'package:flutter_application_cinemax/app/services/providers/api_provider.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final isLoading = true.obs;
  final allMovie = <Api>[].obs; // หนังทั้งหมด
  final foundMovie = <Api>[].obs; // หนังที่ได้จากการค้นหา
  final searchMovie = ''.obs; // ค่าที่ค้นหา

  @override
  void onInit() {
    fetchMovie();
    super.onInit();
  }

  void fetchMovie() async {
    try {
      var result = await Get.find<ApiProvider>().getApi();
      allMovie.clear();
      allMovie.addAll(result);
      foundMovie.value = allMovie;
    } catch (e) {
      print('Error: $e');
    } finally {
      isLoading(false);
    }
  }

  @override
  void onClose() {}
  void filterMovie(String input) {
    List<Api> searchResults = []; 
    if (input.isEmpty) {
      searchResults = allMovie;
    } else {
      searchResults = allMovie
          .where((element) => element.movie
              .toString()
              .toLowerCase()
              .contains(input.toLowerCase()))
          .toList();
    }
    foundMovie.value = searchResults;
  }

  void clearSearch() {
    searchMovie.value = "";
    filterMovie('');
  }
}
