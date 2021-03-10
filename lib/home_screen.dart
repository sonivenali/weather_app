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

      ],
    );
  }
}
