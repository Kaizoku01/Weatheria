
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/common/provider/forecast_weather_provider.dart';
import 'package:weather_app/screens/home_screen/widgets/forecast_weather_label.dart';

import '../../../models/home_screen_model.dart';
import '../../../models/forecast_weather_model.dart';

class ForecastWeatherCard extends StatelessWidget {
  const ForecastWeatherCard({super.key,required this.homeScreenModel});
  final HomeScreenModel homeScreenModel;
  @override
  Widget build(BuildContext context) {
    List<ForecastWeatherModel> forecastWeatherModelList = context.watch<ForecastWeatherProvider>().forecastWeatherModelList;
    return Container(
        height: 150,
        //width: 300,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          gradient: RadialGradient(
            colors: [
              homeScreenModel.timedWeatherCardColor.withOpacity(0.7),
              homeScreenModel.timedWeatherCardColor.withOpacity(0.3),
            ],
            radius: 0.7,
            tileMode: TileMode.clamp,
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.1),
            borderRadius: BorderRadius.circular(25),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  for (int i = 0; i < forecastWeatherModelList.length / 2; i++)
                    ForecastWeatherLabel(forecastWeatherModel: forecastWeatherModelList[i]),
                ],
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 5),
                child: Divider(color: Colors.white,indent: 10, endIndent: 10,thickness: 1,),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  for (double i = forecastWeatherModelList.length / 2; i < forecastWeatherModelList.length; i++)
                    ForecastWeatherLabel(forecastWeatherModel: forecastWeatherModelList[i.toInt()]),
                ],
              ),
            ],
          ),
        ),
      );
  }
}


