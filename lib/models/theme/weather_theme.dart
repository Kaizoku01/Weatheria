import 'package:flutter/material.dart';
import 'package:weather_app/models/home_screen_ui_model.dart';
enum CurrentWeatherTheme {
  thunderstorm,
  rain,
  snow,
  atmosphere,
  sunny,
  cloudy,
}
class WeatherTheme {
  static HomeScreenUIModel getWeatherTheme(CurrentWeatherTheme theme) {
    switch (theme) {
      case CurrentWeatherTheme.sunny:
        return HomeScreenUIModel(
          backDropImage: 'assets/images/sunny_bg.png',
          textColor1: const Color.fromRGBO(239, 170, 130, 1),
          backDropColor: const Color.fromRGBO(181, 170, 110, 1),
          weatherIcon: 'assets/images/sunny.svg',
          weatherCardColor: const Color.fromRGBO(250, 226, 189, 1),
          timedWeatherCardColor: const Color.fromRGBO(250, 226, 189, 1),
          dividerColor: const Color.fromRGBO(239, 170, 130, 1),
        );
      case CurrentWeatherTheme.rain:
        return HomeScreenUIModel(
          backDropImage: 'assets/images/rainy_bg.png',
          textColor1: const Color.fromRGBO(201, 232, 224, 1),
          backDropColor: const Color.fromRGBO(158, 219, 201, 1),
          weatherIcon: 'assets/images/rainy.svg',
          weatherCardColor: const Color.fromRGBO(127, 195, 174, 1),
          timedWeatherCardColor: const Color.fromRGBO(127, 195, 174, 1),
          dividerColor: const Color.fromRGBO(201, 232, 224, 1),
        );
      case CurrentWeatherTheme.snow:
        return HomeScreenUIModel(
          backDropImage: 'assets/images/snowy_bg.png',
          textColor1: const Color.fromRGBO(228, 241, 249, 1),
          backDropColor: const Color.fromRGBO(226, 239, 242, 1),
          weatherIcon: 'assets/images/snowy.svg',
          weatherCardColor: const Color.fromRGBO(153, 184, 204, 1),
          timedWeatherCardColor: const Color.fromRGBO(153, 184, 204, 0.7),
          dividerColor: const Color.fromRGBO(228, 241, 249, 1),
        );
      case CurrentWeatherTheme.thunderstorm:
        return HomeScreenUIModel(
          backDropImage: 'assets/images/thunderstorm_bg.png',
          textColor1: const Color.fromRGBO(194, 184, 255, 1),
          backDropColor: const Color.fromRGBO(92, 112, 157, 1),
          weatherIcon: 'assets/images/rainy.svg',
          weatherCardColor: const Color.fromRGBO(97, 82, 115, 1),
          timedWeatherCardColor: const Color.fromRGBO(204, 218, 255, 1),
          dividerColor: const Color.fromRGBO(194, 184, 255, 1),
        );
      case CurrentWeatherTheme.atmosphere:
        return HomeScreenUIModel(
          backDropImage: 'assets/images/atmosphere_bg.png',
          textColor1: const Color.fromRGBO(133, 167, 143, 1),
          backDropColor: const Color.fromRGBO(203, 244, 250, 1),
          weatherIcon: 'assets/images/atmosphere.svg',
          weatherCardColor: const Color.fromRGBO(159, 220, 168, 1),
          timedWeatherCardColor: const Color.fromRGBO(142, 202, 150, 0.7),
          dividerColor: const Color.fromRGBO(228, 241, 249, 1),
        );
      case CurrentWeatherTheme.cloudy:
        return HomeScreenUIModel(
          backDropImage: 'assets/images/cloudy_bg.png',
          textColor1: const Color.fromRGBO(72, 74, 130, 1),
          backDropColor: const Color.fromRGBO(64, 65, 122, 1),
          weatherIcon: 'assets/images/cloudy.svg',
          weatherCardColor: const Color.fromRGBO(144, 144, 172, 1),
          timedWeatherCardColor: const Color.fromRGBO(72, 74, 130, 1),
          dividerColor: const Color.fromRGBO(72, 74, 130, 1),
        );
      default:
        //This is will not be executing
        return HomeScreenUIModel(
          backDropImage: 'assets/images/sunny_bg.png',
          textColor1: const Color.fromRGBO(239, 170, 130, 1),
          backDropColor: const Color.fromRGBO(181, 170, 110, 1),
          weatherIcon: 'assets/images/sunny.svg',
          weatherCardColor: const Color.fromRGBO(250, 226, 189, 1),
          timedWeatherCardColor: const Color.fromRGBO(250, 226, 189, 1),
          dividerColor: const Color.fromRGBO(239, 170, 130, 1),
        );
    }
  }
}
