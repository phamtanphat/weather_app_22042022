import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app_22042022/data/remote/api_service.dart';
import 'package:weather_app_22042022/data/repository/weather_repository.dart';
import 'package:weather_app_22042022/presentation/features/weather/weather_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MultiProvider(
        providers: [
          Provider(create: (context) => ApiService()),
          ProxyProvider<ApiService, WeatherRepository>(
            create: (context) => WeatherRepository(),
            update: (context, apiService , repository) {
              repository!.updateApiService(apiService: apiService);
              return repository;
            },
          )
        ],
        child: WeatherPage(),
      ),
    );
  }
}