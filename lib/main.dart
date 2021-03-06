import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/notifiers/weather_notifier.dart';
import 'package:weather_app/pages/home_page.dart';

import 'services/weather_service.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => WeatherNotifier(
            ApiWeather(),
          ),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme:
            ThemeData(primaryColor: Colors.blue, accentColor: Colors.lightBlue),
        home: HomePage(),
      ),
    );
  }
}
