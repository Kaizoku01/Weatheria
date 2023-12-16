import 'package:flutter/material.dart';
import 'package:weather_app/services/sub_services/quote_service.dart';
import 'package:weather_app/services/sub_services/weather_service.dart';

import '../models/home_screen_ui_model.dart';

class MainService{

  ///[allApiFetch] This method is central hub for all kinds of API fetching.
  /// This is the method present in the [HomeScreen] FutureBuilder
  static Future<void> allApiFetch(BuildContext context) async {

    //Fetching coordinates method called
    await WeatherService.getCoordinates(context);

    //decoding city name using coordinates
    if (!context.mounted) return;
    String cityName = await WeatherService.getCurrentCity(context);

    //Fetching current weather
    if (!context.mounted) return;
    await WeatherService.getCurrentWeather(cityName: cityName, context: context);

     //Setting up theme according to weather method call
    if(!context.mounted) return;
      HomeScreenUIModel.homeScreenThemeSelector(context: context);

    //Fetching forecast weather
    if (!context.mounted) return;
    await WeatherService.getWeatherForecast(context);

    //Fetching quote
    if (!context.mounted) return;
    await QuoteService.getQuote(context);

  }
}