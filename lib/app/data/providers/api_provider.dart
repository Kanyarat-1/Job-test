import 'package:flutter_application_cinemax/app/data/models/api_model.dart';
import 'package:get/get.dart';

class ApiProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return Api.fromJson(map);
      if (map is List) return map.map((item) => Api.fromJson(item)).toList();
    };
    httpClient.baseUrl = 'https://whoa.onrender.com';
  }

  Future<List<Api>> getApi() async {
    final response = await get('/whoas/random?results=20');
    return  response.body ?? [];

  }
}
