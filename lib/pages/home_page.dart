import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/notifiers/weather_notifier.dart';
import 'package:weather_app/pages/forecast_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future requestData;
  String cidade;

  _setCidade(String cidade) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('city', cidade);
  }

  _getCidade() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String eoq = prefs.getString('city');
    cidade = eoq;
  }

  @override
  void initState() {
    _getCidade();
    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        requestData = Provider.of<WeatherNotifier>(context, listen: false)
            .loadProvider(cidade);
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: requestData,
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
                      Container(
                        margin: EdgeInsets.fromLTRB(30.0, 60.0, 30.0, 0),
                        child: TextField(
                          decoration:
                              InputDecoration(suffixIcon: Icon(Icons.search)),
                          onSubmitted: (text) {
                            setState(() {
                              requestData = Provider.of<WeatherNotifier>(
                                      context,
                                      listen: false)
                                  .loadProvider(text);
                            });
                            _setCidade(text);
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(10, 40, 10, 10),
                        child: Text(
                          snapshot.data.cityName.toUpperCase(),
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
