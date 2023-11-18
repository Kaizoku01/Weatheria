// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:lottie/lottie.dart';
// import 'package:weather_app/models/weather_model.dart';
// import 'package:weather_app/services/weather_service.dart';
//
// class WeatherScreen extends StatefulWidget {
//   const WeatherScreen({super.key});
//
//   @override
//   State<WeatherScreen> createState() => _WeatherScreenState();
// }
//
// class _WeatherScreenState extends State<WeatherScreen> {
//   final _weatherService = WeatherService('9b31021c65318b31ffb85696ec489058'); //API KEY
//   WeatherModel? _weather;
//   final _hour = DateTime.now().hour;
//   int isDayLight = 3; //default night
//
//   _fetchWeather() async {
//     String cityName = await _weatherService.getCurrentCity();
//     try {
//       final weather = await _weatherService.getWeather(cityName);
//       setState(() {
//         _weather = weather;
//       });
//     } catch (e) {
//       rethrow;
//     }
//   }
//
//   String getWeatherAnimation(String? mainCondition) {
//     if (mainCondition == null) return 'assets/loading_animation.json';
//
//     switch (mainCondition.toLowerCase()) {
//       case 'clouds':
//       case 'mist':
//       case 'smoke':
//       case 'haze':
//       case 'dust':
//       case 'fog':
//         return 'assets/cloudy_animation.json';
//       case 'rain':
//       case 'drizzle':
//       case 'shower rain':
//         if (isDayLight == 1) {
//           return 'assets/day_rain_animation.json';
//         }
//         return 'assets/night_rain_animation.json';
//
//       case 'thunderstorm':
//         return 'assets/thunder_animation.json';
//       case 'clear':
//         if (isDayLight == 1) {
//           return 'assets/day_clear_animation.json';
//         }
//         return 'assets/night_clear_animation.json';
//
//       default:
//         return 'assets/day_clear_animation.json';
//     }
//   }
//
//   String getWeatherBackground() {
//     switch (isDayLight) {
//       case 1:
//         return 'assets/day_background.jpg';
//       case 2:
//         return 'assets/evening_background.jpg';
//       case 3:
//         return 'assets/night_background.jpg';
//     }
//     return "";
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     if (_hour >= 6 && _hour < 16) {
//       isDayLight = 1; //day
//     } else if (_hour < 20 && _hour >= 16) {
//       isDayLight = 2; //evening
//     }
//     _fetchWeather();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: Container(
//           decoration: BoxDecoration(
//
//               image: DecorationImage(
//                   image: AssetImage(getWeatherBackground()), fit: BoxFit.fill)),
//           child: Center(
//             child: Column(
//
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 10),
//                   child: Row(
//                     children: [
//                       Icon(
//                         Icons.location_pin,
//                         size: 28,
//                         color: isDayLight == 1 ? Colors.black : Colors.white,
//                       ),
//                       Text(
//                         _weather?.cityName ?? "loading city..",
//                         style: GoogleFonts.rubik(
//                             fontSize: 32, fontWeight: FontWeight.w400, color: isDayLight == 1 ? Colors.black : Colors.white),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Lottie.asset(getWeatherAnimation(_weather?.mainCondition),height: 200,width: 200),
//
//                 const SizedBox(height: 70),
//                 Text(
//                   '${_weather?.temperature}°C',
//                   style: GoogleFonts.rubik(
//                       fontSize: 28, fontWeight: FontWeight.w400,color: isDayLight == 1 ? Colors.black : Colors.white),
//                 ),
//                 const SizedBox(height: 18),
//                 Text(
//                   _weather?.mainCondition ?? "",
//                   style: GoogleFonts.rubik(
//                       fontSize: 22, fontWeight: FontWeight.w400,color: isDayLight == 1 ? Colors.black : Colors.white),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
