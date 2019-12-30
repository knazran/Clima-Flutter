import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const APIkey = "040831924017eb6da90bc37c121b89f1";
const weatherBaseURL = "https://api.openweathermap.org/data/2.5/weather";

class WeatherModel {

  Future<dynamic> getLocationData() async {
    Location location = Location();
    await location.getLocation();

    // Get openWeatherMap API
    NetworkHelper networkHelper = NetworkHelper(url:"$weatherBaseURL?lat=${location.lat}&lon=${location.lng}&appid=$APIkey&units=metric");
    var weatherData = await networkHelper.getData();

    return weatherData;
  }

  Future<dynamic> getCityWeather(query) async{
    String url = "$weatherBaseURL?q=$query&appid=$APIkey&units=metric";
    NetworkHelper networkHelper = NetworkHelper(url: url);

    var weatherData = await networkHelper.getData();

    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
