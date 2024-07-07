import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/Model/weather_model.dart';

class WeatherServices {
  fetchWeather(String cityName, BuildContext context) async {
    //fetches weather from openweatherapi

    //log("cityname"+cityName);
    final response = await http.get(
      Uri.parse(
          "https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=853762467190d191835d9d3e2e9d1881"),
    ); // ${toBeginningOfSentenceCase(cityName)}
    try {
      if (response.statusCode == 200) {
        var json = jsonDecode(response.body);
        log(json.toString());
        return WeatherData.fromJson(json);
      } else {
        Fluttertoast.showToast(
            msg: "Failed to load weather data",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.black,
            textColor: Colors.white,
            fontSize: 16.0);
        Navigator.pop(context);

        throw Exception('Failed to load Weather data');
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
