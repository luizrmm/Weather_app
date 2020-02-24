import 'package:dio/dio.dart';
import 'package:weather_app/models/weather.dart';

class ApiWeather {
  final String baseUrl =
      "https://api.hgbrasil.com/weather?key=918cc734&city_name=";

  Future<Weather> loadData(String cidade) async {
    try {
      Response response = await Dio().get('$baseUrl$cidade');
      return Weather.fromJson(response.data['results']);
    } on DioError catch (e) {
      print(e.response.data);
      throw e;
    }
  }
}
