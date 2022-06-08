import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:weather_app_22042022/data/remote/api_service.dart';
import 'package:weather_app_22042022/data/remote/model/weather_forecast.dart';

class WeatherRepository extends ChangeNotifier{
  late ApiService _apiService;
  WeatherForecast? weatherForecast;

  void updateApiService({required ApiService apiService}) {
    _apiService = apiService;
  }

  void getTempFromCity(String cityName) async {
    try {
      weatherForecast = await fetchTempFromCity(cityName);
    } catch (e) {

    }
    notifyListeners();
  }

  Future<WeatherForecast> fetchTempFromCity(String cityName) {
    Completer<WeatherForecast> completer = Completer();
    _apiService.getTempFromCity(cityName)
        .then((response) => jsonDecode(response.toString()))
        .then((json){
          completer.complete(WeatherForecast.fromJson(json));
        })
        .catchError((error){
            completer.completeError(error);
        });
    return completer.future;
  }
}