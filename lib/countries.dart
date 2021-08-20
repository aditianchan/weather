import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:weather/Weather.dart';

class Country extends StatefulWidget {
  const Country({key}) : super(key: key);
  @override
  _Fetch createState() => _Fetch();
}

class _Fetch extends State<Country> {
  List<Weather> locations = [
    Weather('Afghanistan', 'Afghanistan'),
    Weather('Bangladesh', 'Bangladesh'),
    Weather('Brazil', 'Brazil'),
    Weather('China', 'China'),
    Weather('Denmark', 'Denmark'),
    Weather('France', 'France'),
    Weather('Germany', 'Germany'),
    Weather('India', 'India'),
    Weather('Italy', 'Italy'),
    Weather('Japan', 'Japan'),
    Weather('Malaysia', 'Malaysia'),
    Weather('Nepal', 'Nepal'),
    Weather('North Korea', 'North Korea'),
    Weather('Pakistan', 'Pakistan'),
    Weather('Russia', 'Russia'),
    Weather('Saudi Arabia', 'Saudi Arabia'),
    Weather('Singapore', 'Singapore'),
    Weather('Thailand', 'Thailand'),
    Weather('Thailand', 'Thailand'),
    Weather('United States of America', 'United States of America'),
    Weather('Vietnam', 'Vietnam'),
    Weather('Zimbabwe', 'Zimbabwe'),
  ];

  void updateLocation(index) async {
    Weather fetchWeather = locations[index];
    await fetchWeather.getData();

    //navigate back to the home screen with the new data
    Navigator.pop(context, {
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

  @override

  // This widget is the root of your application.

  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return Navigator.canPop(context);
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("country"),
          centerTitle: true,
        ),
        body: ListView.builder(
            padding: const EdgeInsets.all(8),
            itemCount: locations.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                height: 100,
                color: Colors.white,
                child: Card(
                  elevation: 5,
                  margin: EdgeInsets.only(
                      left: MediaQuery.of(context).size.height * 0.01,
                      top: MediaQuery.of(context).size.height * 0.015,
                      right: MediaQuery.of(context).size.height * 0.01,
                      bottom: MediaQuery.of(context).size.height * 0.013),
                  color: Colors.blue[400],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: ListTile(
                    onTap: () {
                      updateLocation(index);
                    },
                    title: Padding(
                      padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.height * 0.03,
                          top: MediaQuery.of(context).size.height * 0.03),
                      child: Text('${locations[index].city}',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          )),
                    ),
                  ),
                ),
              );
            }),
      ),
    );

    /*Container(
            height: 100,
            color: Colors.white,
            child: Card(
              elevation: 5,
              margin: EdgeInsets.all(10),
              color: Colors.blue[400],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 30, top: 25),
                child: Text('Bangladesh',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    )),
              ),
            ),
          ),
          Container(
            height: 50,
            color: Colors.white,
            child: const Center(child: Text('Brazil')),
          ),
          Container(
            height: 50,
            color: Colors.white,
            child: const Center(child: Text('China')),
          ),
          Container(
            height: 50,
            color: Colors.white,
            child: const Center(child: Text('Denmark')),
          ),
          Container(
            height: 50,
            color: Colors.white,
            child: const Center(child: Text('France')),
          ),
          Container(
            height: 50,
            color: Colors.white,
            child: const Center(child: Text('Germany')),
          ),
          Container(
            height: 50,
            color: Colors.white,
            child: const Center(child: Text('India')),
          ),
          Container(
            height: 50,
            color: Colors.white,
            child: const Center(child: Text('Italy')),
          ),
          Container(
            height: 50,
            color: Colors.white,
            child: const Center(child: Text('Japan')),
          ),
          Container(
            height: 50,
            color: Colors.white,
            child: const Center(child: Text('Malaysia')),
          ),
          Container(
            height: 50,
            color: Colors.white,
            child: const Center(child: Text('Nepal')),
          ),
          Container(
            height: 50,
            color: Colors.white,
            child: const Center(child: Text('North Korea')),
          ),
          Container(
            height: 50,
            color: Colors.white,
            child: const Center(child: Text('Pakistan')),
          ),
          Container(
            height: 50,
            color: Colors.white,
            child: const Center(child: Text('Russia')),
          ),
          Container(
            height: 50,
            color: Colors.white,
            child: const Center(child: Text('Saudi Arabia')),
          ),
          Container(
            height: 50,
            color: Colors.white,
            child: const Center(child: Text('Singapore')),
          ),
          Container(
            height: 50,
            color: Colors.white,
            child: const Center(child: Text('Thailand')),
          ),
          Container(
            height: 50,
            color: Colors.white,
            child: const Center(child: Text('	United States of America')),
          ),
          Container(
            height: 50,
            color: Colors.white,
            child: const Center(child: Text('	Vietnam')),
          ),
          Container(
            height: 50,
            color: Colors.white,
            child: const Center(child: Text('	Zimbabwe')),
          ),*/
  }
}
