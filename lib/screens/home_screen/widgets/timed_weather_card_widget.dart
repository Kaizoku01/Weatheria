
import 'package:flutter/material.dart';
import 'package:weather_app/screens/home_screen/widgets/timed_weather_card_label.dart';

import '../../../models/home_screen_model.dart';
import '../../../models/timed_weather_card_model.dart';

class TimeWeatherCard extends StatelessWidget {
  const TimeWeatherCard({super.key,required this.homeScreenModel});
  final HomeScreenModel homeScreenModel;
  @override
  Widget build(BuildContext context) {
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
                  for (int i = 0; i < TimedWeatherDataModel.weatherLabelList.length / 2; i++)
                    TimedWeatherLabel(labelData: TimedWeatherDataModel.weatherLabelList[i]),
                ],
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 5),
                child: Divider(color: Colors.white,indent: 10, endIndent: 10,thickness: 1,),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  for (double i = TimedWeatherDataModel.weatherLabelList.length / 2; i < TimedWeatherDataModel.weatherLabelList.length; i++)
                    TimedWeatherLabel(labelData: TimedWeatherDataModel.weatherLabelList[i.toInt()]),
                ],
              ),
            ],
          ),
        ),
      );
  }
}


