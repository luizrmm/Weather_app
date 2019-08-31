import 'package:flutter/material.dart';
import 'package:weather_app/pages/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: Colors.green, accentColor: Colors.greenAccent),
      home: HomePage(),
    );
  }
}
