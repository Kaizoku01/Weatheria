import 'package:flutter/material.dart';

import '../../models/weather_model.dart';

class CurrentWeatherProvider with ChangeNotifier{
  WeatherModel? currentWeather;

  updateCurrentWeather(WeatherModel weather){
    currentWeather = weather;
    notifyListeners();
  }
}