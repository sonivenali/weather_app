import 'package:flutter/material.dart';
import 'package:country_state_city_picker/country_state_city_picker.dart';
import 'package:weatherapp/screens/weather_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String countryValue;
  String stateValue;
  String cityValue;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: Image.network(
                        "https://www.setaswall.com/wp-content/uploads/2017/09/Minimalist-Blue-Mountains-2x-Wallpaper-640-x-960.jpg")
                    .image),
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Stack(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 100),
                      child: Text(
                        'Choose your Location',
                        style: Theme.of(context).textTheme.title,
                      ),
                    ),
                  ],
                ),
                Align(
                  alignment: AlignmentDirectional.center,
                  child: SelectState(
                    onCountryChanged: (value) {
                      setState(() {
                        countryValue = value;
                      });
                    },
                    onStateChanged: (value) {
                      setState(() {
                        stateValue = value;
                      });
                    },
                    onCityChanged: (value) {
                      setState(() {
                        cityValue = value;
                      });
                    },
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 50),
                    child: FlatButton(
                      minWidth: 170,
                      height: 50,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => WeatherScreen(cityValue)),
                        );
                      },
                      child: Text(
                        "Proceed",
                        style: TextStyle(color: Colors.black),
                      ),
                      color: Colors.white,
                    ),
                  ),
                )
              ])),
        )
      ],
    );
  }
}
