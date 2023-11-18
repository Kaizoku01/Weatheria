import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/models/home_screen_model.dart';
import '../../../models/weather_model.dart';


class WeatherCard extends StatelessWidget {
  const WeatherCard({super.key, required this.homeScreenModel, required this.weatherModel});
  final HomeScreenModel homeScreenModel;
 final WeatherModel? weatherModel;


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 320,
      decoration: BoxDecoration(
          color: homeScreenModel.weatherCardColor,
          borderRadius: BorderRadius.circular(35),
          ),
      child: Column(
        children: [
          const SizedBox(height: 15),
          Text(
            'Today',
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: homeScreenModel.textColor1),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                homeScreenModel.weatherIcon,
                height: 50,
              ),
              const SizedBox(width: 15),
              Text(
                '${weatherModel?.temperature.toStringAsFixed(1)}°C',
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: homeScreenModel.textColor1),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Column(
            children: [
              Text(
                '${weatherModel?.mainCondition}',
                style: Theme.of(context).textTheme.bodySmall!.copyWith(color: homeScreenModel.textColor1),
              ),
              const SizedBox(height: 22),
              Text(
                '${weatherModel?.cityName}',
                style: Theme.of(context).textTheme.bodySmall!.copyWith(color: homeScreenModel.textColor1),
              ),
              const SizedBox(height: 22),
              Text(
                DateFormat.yMMMMd().format(DateTime.now()),
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(color: homeScreenModel.textColor1),
              ),
              const SizedBox(height: 22),
              IntrinsicHeight(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Feels like ${weatherModel?.feelsLike.toStringAsFixed(1)}°C',
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(color: homeScreenModel.textColor1),
                    ),
                    VerticalDivider(
                      thickness: 1,
                      width: 16,
                      endIndent: 4,
                      indent: 4,
                      color: homeScreenModel.dividerColor,
                    ),
                    Text(
                      'Wind ${weatherModel?.windSpeed.toStringAsFixed(1)} m/s',
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(color: homeScreenModel.textColor1),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 10),
            ],
          )
        ],
      ),
    );
  }
}
