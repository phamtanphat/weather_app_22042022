import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WeatherPage extends StatefulWidget {

  const WeatherPage({Key? key}) : super(key: key);

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  late double width;
  late double height;
  TextEditingController controller = TextEditingController();

  @override
  void didChangeDependencies() {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
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
                child: LayoutBuilder(
                    builder: (context, constraint) {
                      return SingleChildScrollView(
                        child: ConstrainedBox(
                          constraints: BoxConstraints(
                              minHeight: constraint.maxHeight),
                          child: IntrinsicHeight(
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  searchBox(),
                                  tempCity()
                                  // Expanded(flex: 2, child: detailTemp(model))
                                ]),
                          ),
                        ),
                      );
                    }
                )
            ),
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
        suffixIcon: IconButton(icon: Icon(Icons.search), onPressed: () {
        }),
      ),
    );
  }

  Widget tempCity() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text("Montreal",
            style: TextStyle(color: Colors.white, fontSize: width / 18 , fontWeight: FontWeight.bold)),
        Text("19 \u00BA C",
            style: TextStyle(color: Colors.white, fontSize: width / 10)),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              "https://openweathermap.org/img/wn/04n@2x.png",
              width: width / 2,
              height: width / 3,
              fit: BoxFit.fitWidth,
            ),
            SizedBox(
              width: 5,
            ),
            Text("broken clouds",
                style: TextStyle(
                    fontSize: width / 22,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 107, 106, 102)))
          ],
        )
      ],
    );
  }

// Widget detailTemp() {
//   return Row(
//     crossAxisAlignment: CrossAxisAlignment.center,
//     mainAxisAlignment: MainAxisAlignment.center,
//     children: [
//       Expanded(
//         child: Card(
//           child: Container(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 Image.asset("assets/images/ic_humidity.png"),
//                 Text("${model.main?.humidity}",
//                     style: TextStyle(
//                         fontSize: widget.width / 20,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.grey[900])),
//                 Text("Humidity",
//                     style: TextStyle(
//                         fontSize: widget.width / 25,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.grey[500])),
//               ],
//             ),
//           ),
//         ),
//       ),
//       Expanded(
//         child: Card(
//           child: Container(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 Image.asset("assets/images/ic_wind.png"),
//                 Text("${model.wind?.speed}",
//                     style: TextStyle(
//                         fontSize: widget.width / 20,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.grey[900])),
//                 Text("Wind",
//                     style: TextStyle(
//                         fontSize: widget.width / 25,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.grey[500])),
//               ],
//             ),
//           ),
//         ),
//       ),
//       Expanded(
//         child: Card(
//           child: Container(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 Image.asset("assets/images/ic_air_pressure.png"),
//                 Text("${model.main?.pressure}",
//                     style: TextStyle(
//                         fontSize: widget.width / 20,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.grey[900])),
//                 Text("Air pressure",
//                     style: TextStyle(
//                         fontSize: widget.width / 25,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.grey[500])),
//               ],
//             ),
//           ),
//         ),
//       ),
//     ],
//   );
// }

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