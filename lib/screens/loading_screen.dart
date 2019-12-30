import 'package:flutter/material.dart';
import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const APIkey = "040831924017eb6da90bc37c121b89f1";

class LoadingScreen extends StatefulWidget {
  
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  double lat;
  double lng;

  void getLocationData() async {
    Location location = Location();
    await location.getLocation();

    lat = location.lat;
    lng = location.lng;

    // Get openWeatherMap API
    NetworkHelper networkHelper = NetworkHelper(url:"https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lng&appid=$APIkey");
    var weatherData = await networkHelper.getData();

    String city = weatherData["name"];
    int weatherID = weatherData["weather"][0]["id"];
    double temp = weatherData["main"]["temp"];

    print(city);
    print(weatherID);
    print(temp);
  }

  @override
  void initState(){
    super.initState();
    getLocationData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RaisedButton(
          onPressed: () {
            //Get the current location
          },
          child: Text('Get Location'),
        ),
      ),
    );
  }
}

