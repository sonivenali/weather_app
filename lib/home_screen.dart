import 'package:flutter/material.dart';
import 'package:country_state_city_picker/country_state_city_picker.dart';

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

              ])),
        )
      ],
    );
  }
}
