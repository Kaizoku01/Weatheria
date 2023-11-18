class WeatherModel {
  final String cityName;
  final double temperature;
  final String mainCondition;
  final double feelsLike;
  final double windSpeed;

  WeatherModel({
    required this.cityName,
    required this.temperature,
    required this.mainCondition,
    required this.feelsLike,
    required this.windSpeed
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      cityName: json['name'],
      temperature: json['main']['temp'],
      mainCondition: json['weather'][0]['main'],
      feelsLike: json['main']['feels_like'],
      windSpeed: json['wind']['speed'],
    );
  }

}
