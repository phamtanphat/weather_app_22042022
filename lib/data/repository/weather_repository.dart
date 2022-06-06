import 'dart:async';
import 'dart:convert';

import 'package:weather_app_22042022/data/remote/api_service.dart';
import 'package:weather_app_22042022/data/remote/model/weather_forecast.dart';

class WeatherRepository {
  late ApiService _apiService;

  WeatherRepository({required ApiService apiService}) {
    _apiService = apiService;
  }

  Future<WeatherForecast> getTempFromCity(String cityName) {
    Completer<WeatherForecast> completer = Completer();
    _apiService.getTempFromCity(cityName)
        .then((response) => jsonDecode(response.toString()))
        .then((json) => completer.complete(WeatherForecast.fromJson(json)))
        .catchError((error){
            completer.completeError(error);
        });
    return completer.future;
  }
}