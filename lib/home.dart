import 'package:flutter/material.dart';
import 'package:weather/Weather.dart';
import 'package:weather/countries.dart';
import 'package:http/http.dart' as http;
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather/new.dart';
import 'dart:convert';
import './countries.dart';

class Home extends StatefulWidget {
  @override
  _FetchState createState() => _FetchState();
}

class _FetchState extends State<Home> {
  @override
  void initState() {
    super.initState();
  }

  Map data = {};
  Future<bool> _onBackPressed() {
    Navigator.pushReplacementNamed(context, '/new');
  }

  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty
        ? data
        : ModalRoute.of(context).settings.arguments as Map;
    String bgImage = data['mainWeather'];
    if (bgImage != "Clouds" &&
        bgImage != "Rain" &&
        bgImage != "Drizzle" &&
        bgImage != "Snow" &&
        bgImage != "Thunderstorm" &&
        bgImage != "Clear" &&
        bgImage != "Mist") {
      bgImage = "Clear";
    }
    return WillPopScope(
      onWillPop: () async {
        return _onBackPressed();
      },
      child: Scaffold(
        body: Container(
          child: new Stack(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("images/$bgImage.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
                child: new Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.3,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '${data['temp']}°C',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.08,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '${data['mainWeather']}',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 30,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.1),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 15.0),
                            child: Text(
                              'Humidity: ${data['humidity']}',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  fontSize: MediaQuery.of(context).size.height *
                                      0.025,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.03),
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: Text(
                          'Wind: ${data['wind']}',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.025,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.03),
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: Text(
                          'Pressure: ${data['pressure']}',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.025,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                  top: MediaQuery.of(context).size.height * 0.04,
                  left: MediaQuery.of(context).size.width *
                      0.025, //give the values according to your requirement
                  child: new Row(
                    children: [
                      IconButton(
                          icon: const Icon(
                            Icons.add,
                            size: 30,
                          ),
                          onPressed: () async {
                            try {
                              dynamic result =
                                  await Navigator.pushNamed(context, '/choose');
                              print(result);
                              setState(() {
                                data = {
                                  'name': result['name'],
                                  'temp': result['temp'],
                                  'url': result['url'],
                                  'city': result['city'],
                                  'mainWeather': result['mainWeather'],
                                  'description': result['description'],
                                  'humidity': result['humidity'],
                                  'wind': result['wind'],
                                  'pressure': result['pressure']
                                };
                              });
                            } catch (e) {
                              data = {};
                            }
                          }),
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: Text(
                          "${data['name']}",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
