import 'package:flutter/material.dart';
import 'package:weather_app/models/home_screen_ui_model.dart';

class ThemeProvider with ChangeNotifier{
  ///TODO: CREATE A SEPARATE DEFAULT THEME
  HomeScreenUIModel homeScreenUIModel = HomeScreenUIModel(
    backDropImage: 'assets/images/sunny_bg.png',
    textColor1: const Color.fromRGBO(239, 170, 130, 1),
    backDropColor: const Color.fromRGBO(181, 170, 110, 1),
    weatherIcon: 'assets/images/sunny.svg',
    weatherCardColor: const Color.fromRGBO(250, 226, 189, 1),
    timedWeatherCardColor: const Color.fromRGBO(250, 226, 189, 1),
    dividerColor: const Color.fromRGBO(239, 170, 130, 1),
    quoteColor: Colors.white,
  );

  bool themeChange = false;


  void updateTheme(HomeScreenUIModel appTheme){
    homeScreenUIModel = appTheme;
    notifyListeners();
  }

  void toggleThemeChange(){
    themeChange = true;
    notifyListeners();
  }
}