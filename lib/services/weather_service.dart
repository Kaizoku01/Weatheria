import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/common/provider/coordinate_provider.dart';
import 'package:weather_app/common/provider/current_weather_provider.dart';
import 'package:weather_app/common/provider/forecast_weather_provider.dart';
import 'package:weather_app/models/forecast_weather_model.dart';
import 'package:weather_app/services/quote_service.dart';
import '../models/weather_model.dart';
import 'package:http/http.dart' as http;

class WeatherService {
  //base URL for api calling
  static const kBASEURL = 'https://api.openweathermap.org/data/2.5';
  static const apiKey = '9b31021c65318b31ffb85696ec489058';

  ///[getWeather] fetches the weather in converted WeatherModel format
  static Future<void> getCurrentWeather(
      {required String? cityName, required BuildContext context}) async {
    WeatherModel weatherModel;

    final response = await http.get(
        Uri.parse('$kBASEURL/weather?q=$cityName&appid=$apiKey&units=metric'));

    if (response.statusCode == 200) {
      weatherModel = WeatherModel.fromJson(jsonDecode(response.body));

      //CURRENT WEATHER MODEL INITIALIZED
      if (context.mounted) {
        context
            .read<CurrentWeatherProvider>()
            .updateCurrentWeather(weatherModel);
      }
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

    final response = await http.get(Uri.parse(
        '$kBASEURL/forecast?lat=$latitude&lon=$longitude&appid=$apiKey&units=metric'));
    if (response.statusCode == 200) {
      for (int i = 0; i < 10; i++) {
        forecastWeatherModelList.add(
          ForecastWeatherModel.fromJson(
              json: jsonDecode(response.body),
              index: i,
              icon: 'assets/images/cloudy.svg'),
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

  ///[fetchAllWeatherApi] This method is central hub for all kinds of API fetching.
  /// This is the method present in the [HomeScreen] FutureBuilder
  static Future<void> fetchAllWeatherApi(BuildContext context) async {
    //Fetching coordinates method called
    await WeatherService.getCoordinates(context);

    //decoding city name using coordinates
    if (!context.mounted) return;
    String cityName = await getCurrentCity(context);

    //Fetching current weather
    if (!context.mounted) return;
    await getCurrentWeather(cityName: cityName, context: context);

    //Fetching forecast weather
    if (!context.mounted) return;
    await getWeatherForecast(context);

    //Fetching quote 
    if (!context.mounted) return;
    await QuoteService.getQuote(context);
  }
}
