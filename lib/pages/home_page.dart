import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/notifiers/weather_notifier.dart';
import 'package:weather_app/pages/forecast_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future:
            Provider.of<WeatherNotifier>(context, listen: false).loadProvider(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return Container();
              break;
            case ConnectionState.waiting:
              return Center(
                child: CircularProgressIndicator(),
              );
              break;
            case ConnectionState.active:
              return Container();
              break;
            case ConnectionState.done:
              return Container(
                  width: double.infinity,
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.fromLTRB(10, 100, 10, 10),
                        child: Text(
                          snapshot.data.cityName.toUpperCase(),
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
                                  Provider.of<WeatherNotifier>(context).dayWeek,
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
                                  snapshot.data.time + ' last update',
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
                            Provider.of<WeatherNotifier>(context).imgPath,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20.0),
                        child: Text(
                          "${snapshot.data.temp.toString()}°C",
                          style: TextStyle(
                            fontFamily: "Montserrat",
                            fontSize: 76.0,
                          ),
                        ),
                      ),
                      Text(
                        snapshot.data.description,
                        style:
                            TextStyle(fontFamily: "Montserrat", fontSize: 20.0),
                      )
                    ],
                  ));
              break;
            default:
              return Container();
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Forecast()));
        },
        child: Icon(
          Icons.cloud_queue,
          color: Colors.white,
        ),
      ),
    );
  }
}
