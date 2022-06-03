import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WeatherApp2 extends StatefulWidget {
  const WeatherApp2({Key? key}) : super(key: key);

  @override
  _WeatherApp2State createState() => _WeatherApp2State();
}

class _WeatherApp2State extends State<WeatherApp2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Weather app"),),
      backgroundColor: Colors.lightBlueAccent,
      body: Container(
        child: Column(
          children: [
            Expanded(
                flex: 1,
                child: Container(
                    padding: EdgeInsets.all(20),
                    child: TextFormField(
                      decoration: InputDecoration(
                          suffixIcon: Icon(Icons.search),
                          hintText: 'Search...',
                          border:OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30)
                          )
                      ),
                    )
                )),
            Expanded(
                flex: 5,
                child: Column(
                  children: [
                    SizedBox(height: 10),
                    Expanded(
                        flex: 1,
                        child: Container(

                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: Colors.blue,
                          ),
                        )),
                    SizedBox(height: 10),
                    Expanded(
                        flex: 1,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: Colors.blue,
                          ),
                        )),
                    SizedBox(height: 10),
                    Expanded(
                        flex: 1,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: Colors.blue,
                          ),
                        )),
                  ],
                )
            ),
          ],
        ),
      ),
    );
  }
}