import 'package:flutter/material.dart';
import 'package:country_state_city_picker/country_state_city_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weatherapp/screens/weather_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String countryValue;
  String stateValue;
  String cityValue;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: Image.asset("assets/dayview.jpg").image),
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          key: _scaffoldKey,
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
                    padding: const EdgeInsets.only(bottom: 100),
                    child: FlatButton(
                      minWidth: 170,
                      height: 50,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)),
                      onPressed: () async {
                        if (cityValue != null && cityValue.isNotEmpty) {
                          final prefs = await SharedPreferences.getInstance();
                          prefs.setString("city", cityValue);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => WeatherScreen(cityValue)),
                          );
                        } else {
                          _scaffoldKey.currentState.showSnackBar(new SnackBar(
                              content: new Text("Invalid credentials")));
                        }
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
