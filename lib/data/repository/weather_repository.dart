import 'package:weather_app_22042022/data/remote/api_service.dart';

class WeatherRepository {
  late ApiService _apiService;

  WeatherRepository({required ApiService apiService}) {
    _apiService = apiService;
  }

  
}