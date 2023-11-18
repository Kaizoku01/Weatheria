import 'package:flutter/material.dart';
import 'package:weather_app/models/theme/text_theme_model.dart';
import 'package:weather_app/screens/home_screen/home_screen.dart';

void main() {
  runApp(const MyApp());
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
