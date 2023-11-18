import 'dart:convert';

import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

import '../models/weather_model.dart';
import 'package:http/http.dart' as http;

class WeatherService {
  //base URL for api calling
  static const kBASEURL = 'https://api.openweathermap.org/data/2.5/weather';
  final String apiKey;

  WeatherService(this.apiKey);

  static final List<WeatherService> serviceList = [
    /// API KEY FOR [WeatherCard]
    WeatherService('9b31021c65318b31ffb85696ec489058'),
  ];

  ///[getWeather] fetches the weather in converted WeatherModel format
  Future<WeatherModel> getWeather(String? cityName) async {
    final response = await http
        .get(Uri.parse('$kBASEURL?q=$cityName&appid=$apiKey&units=metric'));
    if (response.statusCode == 200) {
      return WeatherModel.fromJson(
          jsonDecode(response.body)); //conversion of response json
    } else {
      throw Exception('Failed to load weather data');
    }
  }

  ///[getCurrentCity] fetches the current cityName using latitude and longitude
  Future<String> getCurrentCity() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    String? city = placemarks[0].locality;

    return city ?? "";
  }
}
