import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_app_22042022/data/remote/model/weather_forecast.dart';
import 'package:weather_app_22042022/data/repository/weather_repository.dart';
import 'package:provider/provider.dart';

class WeatherPage extends StatefulWidget {
  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  late double width;
  late double height;
  TextEditingController controller = TextEditingController();
  late WeatherRepository repository;
  late Future<WeatherForecast> futureData;

  @override
  void didChangeDependencies() {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    repository = context.read();
    futureData = repository.getTempFromCity("Hanoi");
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset("assets/images/background.png"),
          SafeArea(
            child: Container(
                constraints: BoxConstraints.expand(),
                padding: const EdgeInsets.all(5),
                child: LayoutBuilder(builder: (context, constraint) {
                  return SingleChildScrollView(
                    child: ConstrainedBox(
                      constraints:
                          BoxConstraints(minHeight: constraint.maxHeight),
                      child: IntrinsicHeight(
                        child: FutureBuilder<WeatherForecast>(
                          future: futureData,
                          builder: (context, snapshot) {
                            if (snapshot.hasError) {
                              return Center(
                                  child: Text(snapshot.error.toString()));
                            } else if (snapshot.hasData) {
                              return Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [searchBox(), tempCity(snapshot.data!)]);
                            } else {
                              return Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    searchBox(),
                                  ]);
                            }
                          },
                        ),
                      ),
                    ),
                  );
                })),
          ),
        ],
      ),
    );
  }

  Widget searchBox() {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))),
        hintText: "Input city name",
        suffixIcon: IconButton(icon: Icon(Icons.search), onPressed: () {}),
      ),
    );
  }

  Widget tempCity(WeatherForecast data) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text("${data.name}",
            style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold)),
        Text("${data.main?.temp}", style: TextStyle(color: Colors.white, fontSize: 76)),
        Image.network(
          "https://openweathermap.org/img/wn/${data.weather?[0].icon}@2x.png",
          width: width / 4,
          height: width / 4,
          fit: BoxFit.fill,
        ),
        Text("${data.weather?[0].main}",
            style: TextStyle(
                color: Color.fromARGB(235, 235, 245, 200), fontSize: 20)),
        Text("H:${data.main?.tempMax}°   L:${data.main?.tempMin}°",
            style: TextStyle(color: Colors.white, fontSize: 20)),
        Container(
          margin: EdgeInsets.only(top: 20),
          child: InkWell(
            child: Image.asset("assets/images/house.png"),
            onTap: () {
              showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return bottomSheet(5);
                  });
            },
          ),
        ),
      ],
    );
  }

  Widget bottomSheet(int count) {
    return ListView.builder(
        itemCount: count,
        itemBuilder: (context, index) {
          return itemWeatherHour();
        });
  }

  Widget itemWeatherHour() {
    return Container(
      width: 60,
      decoration: BoxDecoration(border: Border.all(width: 30)),
    );
  }

// Widget notFoundCity() {
//   return Container(
//     constraints: BoxConstraints.expand(),
//     child: Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Image.asset("assets/images/ic_not_found.png"),
//         Text("Seems like you aren't on earth",
//             style:
//             TextStyle(fontSize: widget.width / 23, color: Colors.white)),
//       ],
//     ),
//   );
// }
}
