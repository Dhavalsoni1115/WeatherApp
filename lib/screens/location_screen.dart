import 'package:flutter/material.dart';
import 'package:weatherapp/screens/city_screen.dart';
import '../services/weather.dart';

class LocationScreen extends StatefulWidget {
  var data;
  LocationScreen({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

var temp;
var condition, cityName;
var weathericon;
var weathermessage;

class _LocationScreenState extends State<LocationScreen> {
  WeatherModel weather = WeatherModel();
  @override
  void initState() {
    super.initState();
    // print(widget.data);
    updateUI(widget.data);
  }

  void updateUI(dynamic weatherdata) {
    setState(() {
      if (weatherdata == null) {
        temp = 0;
        weathericon = null;
        weathermessage = "null";
        cityName = '';
        return;
      }
      double tempuratre;
      tempuratre = weatherdata['main']['temp'];
      temp = tempuratre.toInt();
      condition = weatherdata['weather'][0]['id'];
      cityName = weatherdata['name'];
      weathericon = weather.getWeatherIcon(condition);
      weathermessage = weather.getMessage(temp);
      print(temp);
      print(condition);
      print(cityName);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/weather1.gif"),
                fit: BoxFit.fill)),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 45, left: 10, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () async {
                      var weatherData = await weather.getLocationWeather();
                      updateUI(weatherData);
                    },
                    child: Icon(
                      Icons.location_on_sharp,
                      color: Colors.white,
                      size: 50,
                    ),
                  ),
                  GestureDetector(
                    onTap: () async {
                      var locationName = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CityScreen(),
                        ),
                      );
                      print(locationName);
                      if (locationName != null) {
                        var weatherdata =
                            await weather.getCityWather(locationName);
                        updateUI(weatherdata);
                      }
                    },
                    child: Icon(
                      Icons.location_city_outlined,
                      color: Colors.white,
                      size: 50,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 180, left: 10),
              child: Row(
                children: [
                  Text(
                    "$temp°",
                    style: TextStyle(color: Colors.white, fontSize: 80),
                  ),
                  Text(
                    weathericon.toString(),
                    style: TextStyle(color: Colors.white, fontSize: 80),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 80),
              child: Text(
                weathermessage.toString(),
                style: TextStyle(color: Colors.white, fontSize: 40),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Text(
                "In",
                style: TextStyle(color: Colors.white, fontSize: 40),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Text(
                cityName.toString(),
                style: TextStyle(color: Colors.white, fontSize: 40),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
