import 'dart:convert';

import 'package:weather_app/models/weather.dart';
import 'package:http/http.dart' as http;

class ApiWeather {
  final String baseUrl =
      "https://api.hgbrasil.com/weather?key=ecf51367&city_name=Caconde";

  Future<Weather> loadData() async {
    Map<String, dynamic> data;
    http.Response response = await http.get(baseUrl);
    data = json.decode(response.body)["results"];
    return Weather.fromJson(data);
  }
}
