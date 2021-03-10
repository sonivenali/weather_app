import 'dart:convert';


import 'package:http/http.dart' as http;
import 'package:weatherapp/models/weather_data.dart';



class Services{
  Future<WeatherData> getWeather(String city) async {
    try{
    final response = await http.get(
      'http://api.openweathermap.org/data/2.5/weather?q=bangalore&appid=6b358bf3715a6e942710d3d5f505ca7a&units=metric',
    );
    final data = json.decode(response.body);
    print(data);
    return WeatherData.fromJson(data);}catch(e,stacktrace){
      print(stacktrace);
    }
  }
}