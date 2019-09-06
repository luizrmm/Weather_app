import 'dart:convert';

import 'package:weather_app/models/weather.dart';
import 'package:http/http.dart' as http;

class ApiWeather {
  final String baseUrl =
      "https://api.hgbrasil.com/weather?key=c5c80adb&city_name=";

  Future<Weather> loadData(String cidade) async {
    Map<String, dynamic> data;
    http.Response response = await http.get('$baseUrl$cidade');
    data = json.decode(response.body)["results"];
    return Weather.fromJson(data);
  }
}
