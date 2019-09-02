import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/notifiers/weather_notifier.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final weatherInfo = Provider.of<WeatherNotifier>(context).clima;
    return Scaffold(
      body: FutureBuilder(
        future: Provider.of<WeatherNotifier>(context).getData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Container(
                width: double.infinity,
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.fromLTRB(10, 100, 10, 10),
                      child: Text(
                        weatherInfo.city_name,
                        style: TextStyle(
                            fontFamily: "Montserrat",
                            fontSize: 40,
                            letterSpacing: 5.0),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Flexible(
                            flex: 2,
                            fit: FlexFit.tight,
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                weatherInfo.date,
                                style: TextStyle(
                                    fontFamily: "Montserrat",
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w600),
                              ),
                            )),
                        SizedBox(
                          width: 1.0,
                          height: 20,
                          child: Container(
                            color: Colors.black,
                          ),
                        ),
                        Flexible(
                            flex: 2,
                            fit: FlexFit.tight,
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                weatherInfo.time,
                                style: TextStyle(
                                    fontFamily: "Montserrat",
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w600),
                              ),
                            )),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 80, 0, 50),
                      child: SizedBox(
                        height: MediaQuery.of(context).size.width * 0.55,
                        child: Image.asset(
                          weatherInfo.imgPath,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20.0),
                      child: Text(
                        "${weatherInfo.temp.toString()}°C",
                        style: TextStyle(
                          fontFamily: "Montserrat",
                          fontSize: 76.0,
                        ),
                      ),
                    ),
                    Text(
                      weatherInfo.description,
                      style:
                          TextStyle(fontFamily: "Montserrat", fontSize: 20.0),
                    )
                  ],
                ));
          } else {
            return Container(
              child: Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                      Theme.of(context).primaryColor),
                ),
              ),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Provider.of<WeatherNotifier>(context).getData();
        },
        child: Icon(
          Icons.refresh,
          color: Colors.white,
        ),
      ),
    );
  }
}
