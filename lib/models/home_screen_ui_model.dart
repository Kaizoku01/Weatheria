import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/common/provider/current_weather_provider.dart';
import 'package:weather_app/common/provider/theme_provider.dart';
import 'package:weather_app/models/theme/weather_theme.dart';
import 'package:weather_app/models/weather_model.dart';

class HomeScreenUIModel {
  HomeScreenUIModel(
      {required this.backDropImage,
      required this.textColor1,
      required this.backDropColor,
      required this.weatherIcon,
      required this.weatherCardColor,
      required this.timedWeatherCardColor,
      required this.dividerColor,
      required this.quoteColor,
      });
  final String backDropImage;
  final Color textColor1;
  final Color backDropColor;
  final String weatherIcon;
  final Color weatherCardColor;
  final Color timedWeatherCardColor;
  final Color dividerColor;
  final Color quoteColor;

  static void homeScreenThemeSelector({required BuildContext context}) {
    WeatherModel? weatherModel =
        context.read<CurrentWeatherProvider>().currentWeather;
    int weatherId = weatherModel!.weatherId;

    ///FOR TESTING OUT DIFFERENT THEMES IN DIFFERENT WEATHERS
    // if(context.read<ThemeProvider>().themeChange == false){
    //       context.read<ThemeProvider>().updateTheme(
    //           WeatherTheme.getWeatherTheme(CurrentWeatherTheme.snow));
    //
    //       context.read<ThemeProvider>().toggleThemeChange();
    // }

    if (weatherId >= 200 && weatherId <= 232) {
      if (context.read<ThemeProvider>().themeChange == false) {
        //updating Theme Provider with Thunderstorm weather theme
        context.read<ThemeProvider>().updateTheme(
            WeatherTheme.getWeatherTheme(CurrentWeatherTheme.thunderstorm));

        context.read<ThemeProvider>().toggleThemeChange();
      }
    } else if ((weatherId >= 300 && weatherId <= 321) ||
        (weatherId >= 500 && weatherId <= 531)) {
      if (context.read<ThemeProvider>().themeChange == false) {
        //updating Theme Provider with rain weather theme
        context.read<ThemeProvider>().updateTheme(
            WeatherTheme.getWeatherTheme(CurrentWeatherTheme.rain));
        context.read<ThemeProvider>().toggleThemeChange();
      }
    } else if (weatherId >= 600 && weatherId <= 622) {
      if (context.read<ThemeProvider>().themeChange == false) {
        //updating Theme Provider with snow weather theme
        context.read<ThemeProvider>().updateTheme(
            WeatherTheme.getWeatherTheme(CurrentWeatherTheme.snow));
        context.read<ThemeProvider>().toggleThemeChange();
      }
    } else if (weatherId >= 701 && weatherId <= 781) {
      if (context.read<ThemeProvider>().themeChange == false) {
        //updating Theme Provider with atmosphere weather theme
        context.read<ThemeProvider>().updateTheme(
            WeatherTheme.getWeatherTheme(CurrentWeatherTheme.atmosphere));
        context.read<ThemeProvider>().toggleThemeChange();
      }
    } else if (weatherId >= 801 && weatherId <= 804) {
      if (context.read<ThemeProvider>().themeChange == false) {
        //updating Theme Provider with cloudy weather theme
        context.read<ThemeProvider>().updateTheme(
            WeatherTheme.getWeatherTheme(CurrentWeatherTheme.cloudy));
        context.read<ThemeProvider>().toggleThemeChange();
      }
    } else {
      if (context.read<ThemeProvider>().themeChange == false) {
        //updating Theme Provider with sunny weather theme
        context.read<ThemeProvider>().updateTheme(
            WeatherTheme.getWeatherTheme(CurrentWeatherTheme.sunny));
        context.read<ThemeProvider>().toggleThemeChange();
      }
    }
  }
}
