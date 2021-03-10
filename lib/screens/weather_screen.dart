import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weatherapp/models/weather_data.dart';
import 'package:weatherapp/services/services.dart';

class WeatherScreen extends StatefulWidget {
  final String cityValue;

  WeatherScreen(this.cityValue);

  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  final services = Services();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: Image.network(
                        "https://i.pinimg.com/originals/b5/bd/5d/b5bd5d41fca3cc3c930bab7284efc517.jpg")
                    .image),
          ),
        ),
        FutureBuilder<WeatherData>(
            future: services.getWeather(widget.cityValue),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return buildBody(snapshot.data);
              } else if (snapshot.hasError) {
                return Center(
                  child: Text("Something went Wrong"),
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            }),
      ],
    );
  }

  Scaffold buildBody(WeatherData data) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        centerTitle: false,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                widget.cityValue,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 35,
                    fontWeight: FontWeight.w600),
              ),
              Text(data.weather[0].description,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.w300)),
              Padding(
                padding: const EdgeInsets.only(left: 32),
                child: Text(data.main.temp.round().toString() + "\u00B0",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 90,
                        fontWeight: FontWeight.w200)),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("H: " + data.main.tempMax.toString() + "\u00B0",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w400)),
                  Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: Text("L: " + data.main.tempMin.toString() + "\u00B0",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w400)),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 72),
                child: Divider(
                  color: Colors.white,
                  thickness: 1,
                ),
              ),
              Row(
                children: [
                  buildTile(
                      "SUNRISE",
                      DateFormat(DateFormat.HOUR_MINUTE)
                          .format(DateTime.fromMillisecondsSinceEpoch(
                        data.sys.sunrise * 1000,
                      ))),
                  buildTile(
                      "SUNSET",
                      DateFormat(DateFormat.HOUR_MINUTE)
                          .format(DateTime.fromMillisecondsSinceEpoch(
                        data.sys.sunset * 1000,
                      )))
                ],
              ),
              Divider(
                color: Colors.white,
                thickness: 1,
              ),
              Row(
                children: [
                  buildTile("WIND", data.wind.speed.toString()),
                  buildTile("HUMIDITY", data.main.humidity.toString()),
                ],
              ),
              Divider(
                color: Colors.white,
                thickness: 1,
              ),
              Row(
                children: [
                  buildTile("FEELS LIKE", data.main.feelsLike.toString()),
                  buildTile("PRESSURE", data.main.pressure.toString()),
                ],
              ),
              Divider(
                color: Colors.white,
                thickness: 1,
              ),
              Row(
                children: [
                  buildTile("VISIBILITY", data.visibility.toString()),
                  buildTile("CLOUDS", data.clouds.all.toString()),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Expanded buildTile(String title, String value) {
    return Expanded(
      flex: 1,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: 18,
                  fontWeight: FontWeight.w400),
            ),
            Text(
              value,
              style: TextStyle(color: Colors.white, fontSize: 30),
            )
          ],
        ),
      ),
    );
  }
}
