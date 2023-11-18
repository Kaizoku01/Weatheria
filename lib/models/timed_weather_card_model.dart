

class TimedWeatherDataModel {
  TimedWeatherDataModel({required this.time, required this.meridiem, required this.weatherIcon, required this.temperature});
  final String time;
  final String meridiem;
  final String weatherIcon;
  final String temperature;

  static List<TimedWeatherDataModel> weatherLabelList = [
    TimedWeatherDataModel(time: 'now', meridiem: '', weatherIcon: 'assets/images/cloudy.svg', temperature: '20'),
    TimedWeatherDataModel(time: '2', meridiem: 'AM', weatherIcon: 'assets/images/cloudy.svg', temperature: '21'),
    TimedWeatherDataModel(time: '3', meridiem: 'AM', weatherIcon: 'assets/images/cloudy.svg', temperature: '22'),
    TimedWeatherDataModel(time: '4', meridiem: 'AM', weatherIcon: 'assets/images/cloudy.svg', temperature: '21'),
    TimedWeatherDataModel(time: '5', meridiem: 'AM', weatherIcon: 'assets/images/cloudy.svg', temperature: '20'),
    TimedWeatherDataModel(time: '6', meridiem: 'AM', weatherIcon: 'assets/images/cloudy.svg', temperature: '21'),
    TimedWeatherDataModel(time: '7', meridiem: 'AM', weatherIcon: 'assets/images/cloudy.svg', temperature: '22'),
    TimedWeatherDataModel(time: '8', meridiem: 'AM', weatherIcon: 'assets/images/cloudy.svg', temperature: '21'),
    TimedWeatherDataModel(time: '9', meridiem: 'AM', weatherIcon: 'assets/images/cloudy.svg', temperature: '20'),
    TimedWeatherDataModel(time: '10', meridiem: 'AM', weatherIcon: 'assets/images/cloudy.svg', temperature: '21'),

  ];
}