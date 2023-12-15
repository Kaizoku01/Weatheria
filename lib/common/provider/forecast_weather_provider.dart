import 'package:flutter/material.dart';
import 'package:weather_app/models/forecast_weather_model.dart';



class ForecastWeatherProvider with ChangeNotifier{
  List<ForecastWeatherModel> forecastWeatherModelList = [];

  updateForecastWeather(List<ForecastWeatherModel> forecastWeatherList){
    forecastWeatherModelList = forecastWeatherList;
    notifyListeners();
  }
}