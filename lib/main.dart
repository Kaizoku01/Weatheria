
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/common/provider/coordinate_provider.dart';
import 'package:weather_app/common/provider/current_weather_provider.dart';
import 'package:weather_app/common/provider/forecast_weather_provider.dart';
import 'package:weather_app/common/provider/quote_provider.dart';
import 'package:weather_app/common/provider/theme_provider.dart';
import 'package:weather_app/models/theme/text_theme_model.dart';
import 'package:weather_app/screens/home_screen/home_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CoordinateProvider()),
        ChangeNotifierProvider(create: (_) => CurrentWeatherProvider()),
        ChangeNotifierProvider(create: (_) => ForecastWeatherProvider()),
        ChangeNotifierProvider(create: (_) => QuoteProvider()),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Poppins',
        textTheme: TextTheme(
          bodyMedium: TextThemeModel.mediumStyle,
          bodyLarge: TextThemeModel.largeStyle,
          bodySmall: TextThemeModel.smallStyle,
        ),
      ),
      home: const HomeScreen(),
    );
  }
}
