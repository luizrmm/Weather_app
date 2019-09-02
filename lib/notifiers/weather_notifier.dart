import 'package:flutter/material.dart';
import 'package:weather_app/models/weather.dart';
import 'package:weather_app/services/weather_service.dart';

class WeatherNotifier with ChangeNotifier {
  ApiWeather api = ApiWeather();

  final String clearNight = "images/clear-night.png";
  final String clearDay = "images/clear-day.png";
  final String cloudy = "images/cloudy.png";
  final String fog = "images/fog.png";
  final String partCloudDay = "images/partly-cloudy-day.png";
  final String partCloudNight = "images/partly-cloudy-night.png";
  final String rain = "images/rain.png";
  final String sleet = "images/sleet.png";
  final String snow = "images/snow.png";
  final String wind = "images/wind.png";

  Weather _clima;

  String _dayWeek;

  String get dayWeek => _dayWeek;

  Weather get clima => _clima;

  WeatherNotifier() {
    weekDay();
  }

  void weekDay() {
    var date = DateTime.now();
    if (date.weekday == 1) {
      _dayWeek = "Segunda-feira";
    } else if (date.weekday == 2) {
      _dayWeek = "Terça-feira";
    } else if (date.weekday == 3) {
      _dayWeek = "Quarta-feira";
    } else if (date.weekday == 4) {
      _dayWeek = "Quinta-feira";
    } else if (date.weekday == 5) {
      _dayWeek = "Sexta-feira";
    } else if (date.weekday == 7) {
      _dayWeek = "Sábado";
    } else {
      _dayWeek = "Domingo";
    }
    notifyListeners();
  }

  Future getData() async {
    _clima = await api.loadData();
    if (_clima.condition_slug == "rain" || _clima.condition_slug == "storm") {
      _clima.imgPath = rain;
    } else if (_clima.condition_slug == "snow") {
      _clima.imgPath = snow;
    } else if (_clima.condition_slug == "fog") {
      _clima.imgPath = wind;
    } else if (_clima.condition_slug == "clear_day") {
      _clima.imgPath = clearDay;
    } else if (_clima.condition_slug == "clear_night") {
      _clima.imgPath = clearNight;
    } else if (_clima.condition_slug == "cloudly_day") {
      _clima.imgPath = partCloudDay;
    } else if (_clima.condition_slug == "cloudly_night") {
      _clima.imgPath = partCloudNight;
    } else if (_clima.condition_slug == "hail") {
      _clima.imgPath = sleet;
    } else {
      _clima.imgPath = cloudy;
    }
    notifyListeners();
    return _clima;
  }
}
