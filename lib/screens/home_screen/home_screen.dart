import 'package:flutter/material.dart';
import 'package:weather_app/models/home_screen_model.dart';
import 'package:weather_app/screens/home_screen/widgets/description_text_widget.dart';
import 'package:weather_app/screens/home_screen/widgets/timed_weather_card_widget.dart';
import 'package:weather_app/screens/home_screen/widgets/weather_card.dart';
import 'package:weather_app/services/weather_service.dart';

import '../../models/weather_model.dart';

class HomeScreen extends StatefulWidget {
   const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
//https://api.openweathermap.org/data/2.5/forecast?lat=28.58&lon=77.33&appid=9b31021c65318b31ffb85696ec489058 for forcast data
class _HomeScreenState extends State<HomeScreen> {
  final HomeScreenModel _homeScreenModel = HomeScreenModel.screenModeList[1];
  final WeatherService _weatherService = WeatherService.serviceList[0];
  WeatherModel? _weather;

   _fetchWeather() async {
     String cityName = await _weatherService.getCurrentCity();
     try {
        final weather = await _weatherService.getWeather(cityName);
       setState(() {
         _weather = weather;
       });

     } catch (e) {
       rethrow;
     }
   }
   @override
  void initState() {
    super.initState();
    _fetchWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _homeScreenModel.backDropColor,
      body: Stack(
        children: [
          // Background image changes according to the weather
          Image.asset(_homeScreenModel.backDropImage,fit: BoxFit.fitHeight,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ///[WeatherCard] --> card with the temperature with weatherIcon
                WeatherCard(homeScreenModel: _homeScreenModel,weatherModel: _weather),
                ///[TimeWeatherCard] --> card with temperature value for every hour
                TimeWeatherCard(homeScreenModel: _homeScreenModel),
                ///[DescriptionWidget] --> descriptive text at the bottom
                const DescriptionWidget(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
