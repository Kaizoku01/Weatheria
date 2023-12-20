import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/common/provider/coordinate_provider.dart';
import 'package:weather_app/common/provider/current_weather_provider.dart';
import 'package:weather_app/common/provider/forecast_weather_provider.dart';
import 'package:weather_app/common/provider/theme_provider.dart';
import 'package:weather_app/models/forecast_weather_model.dart';
import 'package:weather_app/models/home_screen_ui_model.dart';
import '../../models/weather_model.dart';
import 'package:http/http.dart' as http;

class WeatherService {
  //base URL for api calling
  static const kBASEURL = 'https://api.openweathermap.org/data/2.5';
  static const apiKey = '9b31021c65318b31ffb85696ec489058';

  ///[getWeather] fetches the weather in converted WeatherModel format
  static Future<WeatherModel> getCurrentWeather(
      {required String? cityName, required BuildContext context}) async {
    WeatherModel weatherModel;

    final response = await http.get(
        Uri.parse('$kBASEURL/weather?q=$cityName&appid=$apiKey&units=metric'));

    if (response.statusCode == 200) {
      Map<String, dynamic> decodedJson = jsonDecode(response.body);

      weatherModel = WeatherModel.fromJson(decodedJson);

      //CURRENT WEATHER MODEL INITIALIZED
      if (context.mounted) {
        context
            .read<CurrentWeatherProvider>()
            .updateCurrentWeather(weatherModel);
      }
      return weatherModel;
    } else {
      throw Exception('Failed to load weather data');
    }
  }

  ///[getCurrentCity] fetches the current cityName using latitude and longitude
  static Future<String> getCurrentCity(BuildContext context) async {
    //CALLING COORDINATE PROVIDER FOR DECODING CITY
    double latitude =
        Provider.of<CoordinateProvider>(context, listen: false).latitude;
    double longitude =
        Provider.of<CoordinateProvider>(context, listen: false).longitude;

    List<Placemark> placemarks =
        await placemarkFromCoordinates(latitude, longitude);

    String? city = placemarks[0].locality;

    return city ?? "";
  }

  ///[getCoordinates] This method fetch the coordinates of the user and update the [CoordinateProvider]
  static Future<void> getCoordinates(BuildContext context) async {
    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    //COORDINATE PROVIDER INITIALIZED
    if (context.mounted) {
      context
          .read<CoordinateProvider>()
          .updateCoordinates(lat: position.latitude, lon: position.longitude);
    }
  }

  ///[getWeatherForecast] This method fetches the forecast Weather
  static Future<void> getWeatherForecast(BuildContext context) async {
    //CALLING COORDINATE PROVIDER FOR FETCHING FORECAST
    double latitude = context.read<CoordinateProvider>().latitude;
    double longitude = context.read<CoordinateProvider>().longitude;

    List<ForecastWeatherModel> forecastWeatherModelList = [];
    HomeScreenUIModel homeScreenUIModel = context.read<ThemeProvider>().homeScreenUIModel;

    final response = await http.get(Uri.parse(
        '$kBASEURL/forecast?lat=$latitude&lon=$longitude&appid=$apiKey&units=metric'));
    if (response.statusCode == 200) {
      for (int i = 0; i < 10; i++) {
        forecastWeatherModelList.add(
          ForecastWeatherModel.fromJson(
              json: jsonDecode(response.body),
              index: i,
              icon: homeScreenUIModel.weatherIcon), //'assets/images/cloudy.svg'
        );
      }

      //FORECAST WEATHER PROVIDER UPDATED
      if (context.mounted) {
        context
            .read<ForecastWeatherProvider>()
            .updateForecastWeather(forecastWeatherModelList);
      }
    } else {
      throw Exception('Failed to load weather data');
    }
  }
}
