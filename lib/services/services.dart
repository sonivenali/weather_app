import 'dart:convert';


import 'package:http/http.dart' as http;
import 'package:weatherapp/models/weather_data.dart';



class Services{
  Future<WeatherData> getWeather(String city) async {
    final response = await http.get(
      'http://api.openweathermap.org/data/2.5/weather?q=$city&appid=6b358bf3715a6e942710d3d5f505ca7a',
    );
    final data = json.decode(response.body);
    return WeatherData.fromJson(data);
  }
}