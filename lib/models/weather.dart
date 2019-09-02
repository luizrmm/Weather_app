class Weather {
  int temp;
  String date;
  String time;
  String description;
  String currently;
  String condition_slug;
  String city_name;
  String imgPath;

  Weather(
      {this.temp,
      this.date,
      this.time,
      this.description,
      this.currently,
      this.condition_slug,
      this.city_name,
      this.imgPath});

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
        temp: json["temp"],
        date: json["date"],
        time: json["time"],
        description: json["description"],
        currently: json["currently"],
        condition_slug: json["condition_slug"],
        city_name: json["city_name"],
        imgPath: "");
  }
}
