import 'package:dio/dio.dart';

import 'dio_client.dart';

class ApiService {
  late Dio _dio;
  
  ApiService() {
    _dio = DioClient().getDio();
  }
  
  Future getTempFromCity(String cityName) {
    return _dio.get("data/2.5/weather", queryParameters: {
      "appid": "86183a23377ed034aef7aad102f43d64",
      "units": "metric",
      "q": cityName
    });
  }
}