import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/home_screen_ui_model.dart';
import '../../../common/provider/current_weather_provider.dart';

class WeatherCard extends StatelessWidget {
  const WeatherCard({super.key, required this.homeScreenUIModel});
  final HomeScreenUIModel homeScreenUIModel;

  @override
  Widget build(BuildContext context) {
    /// CURRENT WEATHER MODEL PROVIDER CALLED FOR UI INTEGRATION
    return Consumer<CurrentWeatherProvider>(
      builder: (context, currentWeatherProvider, _) {
        final currentWeatherModel = currentWeatherProvider.currentWeather;
        return Container(
          height: 320,
          decoration: BoxDecoration(
            color: homeScreenUIModel.weatherCardColor,
            borderRadius: BorderRadius.circular(35),
          ),
          child: Column(
            children: [
              const SizedBox(height: 15),
              Text(
                'Today',
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: homeScreenUIModel.textColor1),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    homeScreenUIModel.weatherIcon,
                    height: 50,
                  ),
                  const SizedBox(width: 15),
                  Text(
                    '${currentWeatherModel?.temperature.toStringAsFixed(1)}°C',
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(color: homeScreenUIModel.textColor1),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Column(
                children: [
                  Text(
                    '${currentWeatherModel?.mainCondition}',
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(color: homeScreenUIModel.textColor1),
                  ),
                  const SizedBox(height: 22),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '${currentWeatherModel?.cityName}',
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .copyWith(color: homeScreenUIModel.textColor1),
                      ),
                    ],
                  ),
                  const SizedBox(height: 22),
                  Text(
                    DateFormat.yMMMMd().format(DateTime.now()),
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(color: homeScreenUIModel.textColor1),
                  ),
                  const SizedBox(height: 22),
                  IntrinsicHeight(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Feels like ${currentWeatherModel?.feelsLike.toStringAsFixed(1)}°C',
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(color: homeScreenUIModel.textColor1),
                        ),
                        VerticalDivider(
                          thickness: 1,
                          width: 16,
                          endIndent: 4,
                          indent: 4,
                          color: homeScreenUIModel.dividerColor,
                        ),
                        Text(
                          'Wind ${currentWeatherModel?.windSpeed.toStringAsFixed(1)} m/s',
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(color: homeScreenUIModel.textColor1),
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
      },
    );
  }
}
