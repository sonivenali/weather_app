import 'package:flutter/material.dart';

class WeatherScreen extends StatefulWidget {
  final String cityValue;

  WeatherScreen(this.cityValue);

  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
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
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            centerTitle: false,
            elevation: 0,
            backgroundColor: Colors.transparent,
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.cityValue,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 35,
                        fontWeight: FontWeight.w600),
                  ),

                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
