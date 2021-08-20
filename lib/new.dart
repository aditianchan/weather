import 'package:flutter/material.dart';
import 'package:weather/home.dart';
import 'package:weather/Weather.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

class Load extends StatefulWidget {
  const Load({key}) : super(key: key);

  @override
  _New createState() => _New();
}

class _New extends State<Load> {
  Position position;
  Placemark place;
  String sublocality;

  void setupWeatherData() async {
    position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    print(position);
    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    place = placemarks[0];
    sublocality = place.administrativeArea;

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
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
