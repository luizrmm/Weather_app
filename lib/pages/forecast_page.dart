import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/notifiers/weather_notifier.dart';

class Forecast extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final forecast = Provider.of<WeatherNotifier>(context).data.forecast;
    return Scaffold(
      appBar: AppBar(
        title: Text("Previsão"),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: forecast.length,
        itemBuilder: (context, index) {
          return Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(vertical: 6.0, horizontal: 15.0),
                child: Image.asset(
                  Provider.of<WeatherNotifier>(context)
                      .setImagePathForecast(forecast[index]["condition"]),
                  height: 120,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(forecast[index]["weekday"] +
                      " " +
                      forecast[index]["date"]),
                  Text(
                    forecast[index]["description"],
                    style: TextStyle(fontSize: 14.0),
                  )
                ],
              )
            ],
          );
        },
      ),
    );
  }
}
