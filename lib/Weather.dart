import 'package:http/http.dart';
import 'dart:convert';

class Weather {
  String city = '';
  String name = '';
  String url = '';
  num temp = 0;
  String mainWeather = '';
  String description = '';
  double humidity = 0;
  Object coord = {};
  num wind = 0;
  num pressure = 0;

  Weather(String city, String url) {
    this.city = city;
    this.url = url;
  }

  Future<Weather> getData() async {
    try {
      String myUrl =
          "https://api.openweathermap.org/data/2.5/weather?q=$url&appid=63af7a75c9468e6bb0834f0e2932e1c0";

      Response response = await get(Uri.parse(myUrl));

      Map responseJson = json.decode(response.body);

      name = responseJson['name'];
      temp = double.parse(
          (responseJson['main']['temp'] - 273.15).toStringAsFixed(2));
      mainWeather = responseJson['weather'][0]['main'];
      description = responseJson['weather'][0]['description'];
      humidity = responseJson['main']['temp'];
      coord = responseJson['coord'];
      wind = responseJson['wind']['speed'];
      pressure = responseJson['main']['pressure'];
    } catch (e) {
      print('Uncaught weather fetch error');
    }
  }

  // factory Weather.fromJson(Map<String, dynamic> json) {
  //   return Weather(
  //       name: json['name'],
  //       temp: double.parse((json['main']['temp'] - 273.15).toStringAsFixed(2)),
  //       mainWeather: json['weather'][0]['main'],
  //       description: json['weather'][0]['description'],
  //       humidity: json['main']['temp'],
  //       coord: json['coord']);
  // }
}
