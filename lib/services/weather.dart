import 'package:weatherapp/services/location.dart';
import 'package:weatherapp/services/networking.dart';

const String apiKey = '8cc159acdb2e1819882625f7361be9d5';
const openWeatherMapUrl = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  Future<dynamic> getCityWather(String cityName) async {
    var url = '$openWeatherMapUrl?q=$cityName&appid=$apiKey&units=metric';
    NetworkHelper networkHelper = NetworkHelper(url);
    var wetherdata = await networkHelper.getData();
    return wetherdata;
  }

  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    await location.getCurrentLocation();
    var latitude = location.latitude;
    var longitude = location.longitude;
    NetworkHelper networkHelper = NetworkHelper(
        '$openWeatherMapUrl?lat=$latitude&lon=$longitude&appid=$apiKey&units=metric');
    var weatherdata = await networkHelper.getData();
    return weatherdata;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌨️';
    } else if (condition < 400) {
      return '🌧️';
    } else if (condition < 600) {
      return '☔';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫️';
    } else if (condition == 800) {
      return '🌞';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👔';
    } else if (temp < 10) {
      return 'You\ll need 🧣🧤🧦';
    } else {
      return 'Bring 🧥 just now';
    }
  }
}
