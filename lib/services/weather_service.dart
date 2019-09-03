import 'dart:convert';

import 'package:weather_app/models/weather.dart';
import 'package:http/http.dart' as http;

class ApiWeather {
  final String baseUrl =
      "https://api.hgbrasil.com/weather?key=03455d97&user_ip=remote";

  Future<Weather> loadData() async {
    Map<String, dynamic> data;
    http.Response response = await http.get(baseUrl);
    data = json.decode(response.body)["results"];
    return Weather.fromJson(data);
  }
}
