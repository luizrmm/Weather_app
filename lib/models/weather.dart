class Weather {
  int temp;
  String time;
  String description;
  String currently;
  String conditionSlug;
  String cityName;
  List forecast;

  Weather({
    this.temp,
    this.time,
    this.description,
    this.currently,
    this.conditionSlug,
    this.cityName,
    this.forecast,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
        temp: json["temp"],
        time: json["time"],
        description: json["description"],
        currently: json["currently"],
        conditionSlug: json["condition_slug"],
        cityName: json["city_name"],
        forecast: json["forecast"]);
  }
}
