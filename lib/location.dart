import 'package:flutter/material.dart';
import './home.dart';
import 'package:weather/Weather.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Loading extends StatefulWidget {
  const Loading({key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  Position position;
  Placemark place;
  String sublocality;

  void setupWeatherData() async {
    new Future.delayed(const Duration(seconds: 3), () async {
      position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      print(position);
      List<Placemark> placemarks =
          await placemarkFromCoordinates(position.latitude, position.longitude);
      place = placemarks[0];
      sublocality = place.administrativeArea;

      print(placemarks);
      print(sublocality);
      Weather fetchWeather = new Weather(sublocality, sublocality);
      await fetchWeather.getData();
      Navigator.pushReplacementNamed(context, '/home', arguments: {
        'city': fetchWeather.city,
        'name': fetchWeather.name,
        'url': fetchWeather.url,
        'temp': fetchWeather.temp,
        'mainWeather': fetchWeather.mainWeather,
        'description': fetchWeather.description,
        'humidity': fetchWeather.humidity,
        'coord': fetchWeather.coord,
        'wind': fetchWeather.wind,
        'pressure': fetchWeather.pressure
      });
    });
  }

  Future<bool> _onBackPressed() {
    Navigator.of(context).pop(true);
  }

  @override
  void initState() {
    super.initState();

    setupWeatherData();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return _onBackPressed();
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Image.asset(
            "images/tenor2.gif",
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
          ),
        ),
      ),
    );
  }
}
