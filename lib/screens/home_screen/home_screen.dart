import 'package:flutter/material.dart';
import 'package:weather_app/models/home_screen_model.dart';
import 'package:weather_app/screens/home_screen/widgets/description_text_widget.dart';
import 'package:weather_app/screens/home_screen/widgets/forecast_weather_card.dart';
import 'package:weather_app/screens/home_screen/widgets/weather_card.dart';
import 'package:weather_app/services/main_service.dart';



class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  //BACKGROUND UI MODEL
  final HomeScreenModel _homeScreenModel = HomeScreenModel.screenModeList[5];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _homeScreenModel.backDropColor,
      body: FutureBuilder(
        future: MainService.allApiFetch(context),
        builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}, Kindly reload app'));
          }
          return Stack(
            children: [
              // Background image changes according to the weather
              Image.asset(
                _homeScreenModel.backDropImage,
                fit: BoxFit.fitHeight,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ///[WeatherCard] --> card with the temperature with weatherIcon
                    WeatherCard(
                        homeScreenModel: _homeScreenModel),

                    ///[TimeWeatherCard] --> card with temperature value for every hour
                    ForecastWeatherCard(homeScreenModel: _homeScreenModel),

                    ///[DescriptionWidget] --> descriptive text at the bottom
                    const DescriptionWidget(),
                  ],
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
