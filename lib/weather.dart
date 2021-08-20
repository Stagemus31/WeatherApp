class Weather {
  final double temperature;
  final String description;
  final String city;
  final String icon;

  Weather(
    this.temperature,
    this.description,
    this.city,
    this.icon,
  );
  factory Weather.fromBody(Map<String, dynamic> json) {
    return Weather(
      json["main"]["temp"],
      json["weather"][0]["main"],
      json["name"],
      json["weather"][0]["icon"],
    );
  }
}
