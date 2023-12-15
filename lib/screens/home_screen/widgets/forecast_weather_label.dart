import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../models/theme/text_theme_model.dart';
import '../../../models/forecast_weather_model.dart';

class ForecastWeatherLabel extends StatelessWidget {
  const ForecastWeatherLabel({super.key, required this.forecastWeatherModel});
  final ForecastWeatherModel forecastWeatherModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(ForecastWeatherModel.extractHourFromTimestamp(forecastWeatherModel.timeStamp),style: Theme.of(context).textTheme.bodySmall!.copyWith(color: ColorSchemeModel.textColor2),),
        Row(
          children: [
            SvgPicture.asset(
              forecastWeatherModel.weatherIcon,
              color: Colors.white,
              height: 12,
            ),
            const SizedBox(width: 5),
            Text('${forecastWeatherModel.temperature.toStringAsFixed(1)} °',style: Theme.of(context).textTheme.bodySmall!.copyWith(color: ColorSchemeModel.textColor2),),
          ],
        ),
      ],
    );
  }
}
