import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../models/theme/text_theme_model.dart';
import '../../../models/timed_weather_card_model.dart';

class TimedWeatherLabel extends StatelessWidget {
  const TimedWeatherLabel({super.key, required this.labelData});

  final TimedWeatherDataModel labelData;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('${labelData.time} ${labelData.meridiem}',style: Theme.of(context).textTheme.bodySmall!.copyWith(color: ColorSchemeModel.textColor2),),
        Row(
          children: [
            SvgPicture.asset(
              labelData.weatherIcon,
              color: Colors.white,
              height: 12,
            ),
            const SizedBox(width: 5),
            Text('${labelData.temperature} °',style: Theme.of(context).textTheme.bodySmall!.copyWith(color: ColorSchemeModel.textColor2),),
          ],
        ),
      ],
    );
  }
}
