class WeatherModel {
  final String cityName;
  final double temperature;
  final String mainCondition;
  final double feelsLike;
  final double windSpeed;
  final int weatherId;

  WeatherModel({
    required this.cityName,
    required this.temperature,
    required this.mainCondition,
    required this.feelsLike,
    required this.windSpeed,
    required this.weatherId,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      cityName: json['name'],
      temperature: json['main']['temp'].toDouble(),
      mainCondition: json['weather'][0]['main'],
      feelsLike: json['main']['feels_like'].toDouble(),
      windSpeed: json['wind']['speed'].toDouble(),
      weatherId: json['weather'][0]['id'],
    );
  }

}
