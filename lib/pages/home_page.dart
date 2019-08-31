import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: double.infinity,
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(10, 100, 10, 10),
                child: Text(
                  "MUZAMBINHO",
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
                          "SEXTA FEIRA",
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
                          "6:00 PM",
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
                    "images/rain.png",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: Text(
                  "12°C",
                  style: TextStyle(fontFamily: "Montserrat", fontSize: 76.0),
                ),
              ),
              Text(
                "RAIN",
                style: TextStyle(fontFamily: "Montserrat", fontSize: 20.0),
              )
            ],
          )),
    );
  }
}
