import 'package:intl/intl.dart';

// class TimedWeatherDataModel {
//   TimedWeatherDataModel(
//       {required this.time,
//       required this.meridiem,
//       required this.weatherIcon,
//       required this.temperature});
//   final String time;
//   final String meridiem;
//   final String weatherIcon;
//   final String temperature;
//
//   // static List<TimedWeatherDataModel> weatherLabelList = [
//   //   TimedWeatherDataModel(
//   //       time: 'now',
//   //       meridiem: '',
//   //       weatherIcon: 'assets/images/cloudy.svg',
//   //       temperature: '20'),
//   //   TimedWeatherDataModel(
//   //       time: '2',
//   //       meridiem: 'AM',
//   //       weatherIcon: 'assets/images/cloudy.svg',
//   //       temperature: '21'),
//   //   TimedWeatherDataModel(
//   //       time: '3',
//   //       meridiem: 'AM',
//   //       weatherIcon: 'assets/images/cloudy.svg',
//   //       temperature: '22'),
//   //   TimedWeatherDataModel(
//   //       time: '4',
//   //       meridiem: 'AM',
//   //       weatherIcon: 'assets/images/cloudy.svg',
//   //       temperature: '21'),
//   //   TimedWeatherDataModel(
//   //       time: '5',
//   //       meridiem: 'AM',
//   //       weatherIcon: 'assets/images/cloudy.svg',
//   //       temperature: '20'),
//   //   TimedWeatherDataModel(
//   //       time: '6',
//   //       meridiem: 'AM',
//   //       weatherIcon: 'assets/images/cloudy.svg',
//   //       temperature: '21'),
//   //   TimedWeatherDataModel(
//   //       time: '7',
//   //       meridiem: 'AM',
//   //       weatherIcon: 'assets/images/cloudy.svg',
//   //       temperature: '22'),
//   //   TimedWeatherDataModel(
//   //       time: '8',
//   //       meridiem: 'AM',
//   //       weatherIcon: 'assets/images/cloudy.svg',
//   //       temperature: '21'),
//   //   TimedWeatherDataModel(
//   //       time: '9',
//   //       meridiem: 'AM',
//   //       weatherIcon: 'assets/images/cloudy.svg',
//   //       temperature: '20'),
//   //   TimedWeatherDataModel(
//   //       time: '10',
//   //       meridiem: 'AM',
//   //       weatherIcon: 'assets/images/cloudy.svg',
//   //       temperature: '21'),
//   // ];
// }

class ForecastWeatherModel {
  ForecastWeatherModel(
      {required this.timeStamp,
      required this.temperature,
     required this.weatherIcon});
  final int timeStamp;
  final double temperature;
  final String weatherIcon;

  factory ForecastWeatherModel.fromJson(
      {required Map<String, dynamic> json, required int index, required String icon}) {
    return ForecastWeatherModel(
      timeStamp: json['list'][index]['dt'],
      temperature: json['list'][index]['main']['temp'],
      weatherIcon: icon,
    );
  }

  ///[convertTimestampToTime] This method converts the integer timestamp to usable format (HH:MM Meridian)
  static String convertTimestampToTime(int timestamp) {
    // Create a DateTime object from the provided timestamp
    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);

    // Format the DateTime object to 12-hour format with AM/PM using DateFormat
    String formattedTime = DateFormat('h:mm a').format(dateTime);

    return formattedTime;
  }

  ///[extractHourFromTimestamp] This method converts the integer timestamp to usable format (HH Meridian)
  static String extractHourFromTimestamp(int timestamp) {
    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);

    // Extract only the hour part from the timestamp
    int hour = dateTime.hour;

    // Determine whether it's AM or PM based on the hour
    String amOrPm = (hour < 12) ? 'AM' : 'PM';

    // Convert 24-hour format to 12-hour format
    if (hour > 12) {
      hour -= 12;
    } else if (hour == 0) {
      hour = 12;
    }

    // Construct the string representation of the hour with AM/PM
    String formattedHour = '$hour $amOrPm';

    return formattedHour;
  }
}
