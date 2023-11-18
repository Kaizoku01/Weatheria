import 'dart:ui';

class HomeScreenModel {
  HomeScreenModel(
      {required this.backDropImage,
      required this.textColor1,
      required this.backDropColor,
      required this.weatherIcon,
      required this.weatherCardColor,
      required this.timedWeatherCardColor,
      required this.dividerColor});
  final String backDropImage;
  final Color textColor1;
  final Color backDropColor;
  final String weatherIcon;
  final Color weatherCardColor;
  final Color timedWeatherCardColor;
  final Color dividerColor;

  static List<HomeScreenModel> screenModeList = [
    //Cloudy Weather Model
    HomeScreenModel(
      backDropImage: 'assets/images/cloudy_bg.png',
      textColor1: const Color.fromRGBO(72, 74, 130, 1),
      backDropColor: const Color.fromRGBO(64, 65, 122, 1),
      weatherIcon: 'assets/images/cloudy.svg',
      weatherCardColor: const Color.fromRGBO(144, 144, 172, 1),
      timedWeatherCardColor: const Color.fromRGBO(72, 74, 130, 1),
      dividerColor: const Color.fromRGBO(72, 74, 130, 1),
    ),
    //Sunny Weather Model
    HomeScreenModel(
      backDropImage: 'assets/images/sunny_bg.png',
      textColor1: const Color.fromRGBO(239, 170, 130, 1),
      backDropColor: const Color.fromRGBO(181, 170, 110, 1),
      weatherIcon: 'assets/images/sunny.svg',
      weatherCardColor: const Color.fromRGBO(250, 226, 189, 1),
      timedWeatherCardColor: const Color.fromRGBO(250, 226, 189, 1),
      dividerColor: const Color.fromRGBO(239, 170, 130, 1),
    ),
    //Rainy Weather Model
    HomeScreenModel(
      backDropImage: 'assets/images/rainy_bg.png',
      textColor1: const Color.fromRGBO(201, 232, 224, 1),
      backDropColor: const Color.fromRGBO(158, 219, 201, 1),
      weatherIcon: 'assets/images/rainy.svg',
      weatherCardColor: const Color.fromRGBO(127, 195, 174, 1),

      timedWeatherCardColor: const Color.fromRGBO(127, 195, 174, 1),
      dividerColor: const Color.fromRGBO(201, 232, 224, 1),
    ),
    //Thunderstorm Weather Model
    HomeScreenModel(
      backDropImage: 'assets/images/thunderstorm_bg.png',
      textColor1: const Color.fromRGBO(194,184,255,1),
      backDropColor: const Color.fromRGBO(92, 112, 157, 1),
      weatherIcon: 'assets/images/rainy.svg',
      weatherCardColor: const Color.fromRGBO(97,82,115,1),
      timedWeatherCardColor: const Color.fromRGBO(204, 218, 255, 1),
      dividerColor: const Color.fromRGBO(194,184,255,1),
    ),
  ];
}
