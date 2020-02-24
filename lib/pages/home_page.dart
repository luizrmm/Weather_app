import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/notifiers/weather_notifier.dart';
import 'package:weather_app/pages/forecast_page.dart';

import '../notifiers/weather_notifier.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController _cidade = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        color: Colors.white,
        child: Consumer<WeatherNotifier>(
          builder: (context, weather, child) {
            return weather.loading || weather.data == null
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.fromLTRB(30.0, 60.0, 30.0, 0),
                        child: TextField(
                          controller: _cidade,
                          decoration: InputDecoration(
                              suffixIcon: IconButton(
                            onPressed: () {
                              weather.loadProvider(_cidade.text);
                              weather.setCidade(_cidade.text);
                            },
                            icon: Icon(Icons.search),
                          )),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(10, 40, 10, 10),
                        child: Text(
                          weather.data.cityName.toUpperCase(),
                          textAlign: TextAlign.center,
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
                                weather.data.time + ' last update',
                                style: TextStyle(
                                    fontFamily: "Montserrat",
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 80, 0, 50),
                        child: SizedBox(
                          height: MediaQuery.of(context).size.width * 0.55,
                          child: Image.asset(
                            weather.imgPath,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20.0),
                        child: Text(
                          "${weather.data.temp.toString()}°C",
                          style: TextStyle(
                            fontFamily: "Montserrat",
                            fontSize: 76.0,
                          ),
                        ),
                      ),
                      Text(
                        weather.data.description,
                        style:
                            TextStyle(fontFamily: "Montserrat", fontSize: 20.0),
                      )
                    ],
                  );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Forecast()));
        },
        child: Icon(
          Icons.cloud,
          color: Colors.white,
        ),
      ),
    );
  }
}
