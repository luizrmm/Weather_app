import 'package:flutter/material.dart';
import 'package:weather_app/models/weather.dart';
import 'package:weather_app/services/weather_service.dart';

class WeatherNotifier with ChangeNotifier {
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

  String _dayWeek;

  String _imgPath;

  Weather _data;

  String get dayWeek => _dayWeek;

  String get imgPath => _imgPath;

  Weather get data => _data;

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

  void setImagePath(String weatherCondition) {
    if (weatherCondition == "rain" || weatherCondition == "storm") {
      _imgPath = rain;
    } else if (weatherCondition == "snow") {
      _imgPath = snow;
    } else if (weatherCondition == "fog") {
      _imgPath = wind;
    } else if (weatherCondition == "clear_day") {
      _imgPath = clearDay;
    } else if (weatherCondition == "clear_night") {
      _imgPath = clearNight;
    } else if (weatherCondition == "cloudly_day") {
      _imgPath = partCloudDay;
    } else if (weatherCondition == "cloudly_night") {
      _imgPath = partCloudNight;
    } else if (weatherCondition == "hail") {
      _imgPath = sleet;
    } else {
      _imgPath = cloudy;
    }
    notifyListeners();
  }

  String setImagePathForecast(String weatherCondition) {
    if (weatherCondition == "rain" || weatherCondition == "storm") {
      return rain;
    } else if (weatherCondition == "snow") {
      return snow;
    } else if (weatherCondition == "fog") {
      return wind;
    } else if (weatherCondition == "clear_day") {
      return clearDay;
    } else if (weatherCondition == "clear_night") {
      return clearNight;
    } else if (weatherCondition == "cloudly_day") {
      return partCloudDay;
    } else if (weatherCondition == "cloudly_night") {
      return partCloudNight;
    } else if (weatherCondition == "hail") {
      return sleet;
    } else {
      return cloudy;
    }
  }

  Future loadProvider() async {
    _data = await ApiWeather().loadData();
    setImagePath(_data.conditionSlug);
    return _data;
  }
}
