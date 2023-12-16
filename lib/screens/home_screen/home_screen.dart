import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/common/provider/theme_provider.dart';
import 'package:weather_app/models/home_screen_ui_model.dart';
import 'package:weather_app/screens/home_screen/widgets/description_text_widget.dart';
import 'package:weather_app/screens/home_screen/widgets/forecast_weather_card.dart';
import 'package:weather_app/screens/home_screen/widgets/weather_card.dart';
import 'package:weather_app/services/main_service.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
        return Consumer<ThemeProvider>(
          builder: (context, themeProvider, _) {
            HomeScreenUIModel homeScreenUIModel = themeProvider.homeScreenUIModel;
            return Scaffold(
              backgroundColor: homeScreenUIModel.backDropColor,
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
                        homeScreenUIModel.backDropImage,
                        fit: BoxFit.fitHeight,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ///[WeatherCard] --> card with the temperature with weatherIcon
                            WeatherCard(
                                homeScreenUIModel: homeScreenUIModel),

                            ///[TimeWeatherCard] --> card with temperature value for every hour
                            ForecastWeatherCard(homeScreenModel: homeScreenUIModel),

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
          },
        );
  }
}
