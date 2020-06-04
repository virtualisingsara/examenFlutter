import 'package:flutter/material.dart';
import 'package:weather/src/pages/home_page.dart';
import 'package:weather/src/pages/weather_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Weather",
      initialRoute: "/",
      routes: {
        "/": (BuildContext context) => HomePage(),
        "weather": (BuildContext context) => WeatherPage(),
      },
    );
  }
}