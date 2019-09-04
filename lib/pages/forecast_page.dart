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
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Container(
                    child: Image.asset(Provider.of<WeatherNotifier>(context)
                        .setImagePathForecast(forecast[index]["condition"])),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.fromLTRB(15.0, 0, 15.0, 12.0),
                        child: RichText(
                          text: TextSpan(
                            text: '${forecast[index]["weekday"]}   ',
                            style: TextStyle(
                                color: Colors.grey[800],
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0,
                                fontFamily: 'Montserrat'),
                            children: <TextSpan>[
                              TextSpan(
                                  text: forecast[index]["date"],
                                  style: TextStyle(
                                      color: Colors.grey[700],
                                      fontWeight: FontWeight.normal,
                                      fontSize: 14.0)),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: Text(
                          forecast[index]["description"],
                          style: TextStyle(fontFamily: 'Montserrat'),
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 0),
                        child: Text(
                          'Max ${forecast[index]["max"]}°C',
                          style: TextStyle(
                              color: Colors.red, fontFamily: 'Montserrat'),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 12.0),
                        child: Text(
                          'Min ${forecast[index]["min"]}°C',
                          style: TextStyle(
                              color: Colors.blue, fontFamily: 'Montserrat'),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
