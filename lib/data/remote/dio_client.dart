import 'package:dio/dio.dart';

class DioClient {
  static final DioClient _instance = DioClient._internal();
  static late Dio _dio;

  factory DioClient() {
    _dio = Dio(BaseOptions(
      baseUrl: 'http://api.openweathermap.org/',
      connectTimeout: 30000,
      receiveTimeout: 30000,
    ));
    return _instance;
  }

  DioClient._internal();

  Dio getDio() {
    return _dio;
  }
}