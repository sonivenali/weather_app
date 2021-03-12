import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weatherapp/screens/weather_screen.dart';

import 'home_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    checkAndGoToNextPage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(mainAxisSize: MainAxisSize.min,
          children: [
            ClipRRect(
              child: Image.asset(
                "assets/icon.png",
                height: 100,
                width: 100,
              ),
              borderRadius: BorderRadius.circular(24),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Text("WEATHER",style: TextStyle(fontSize: 20,letterSpacing: 4,color: Colors.blueGrey),),
            )
          ],
        ),
      ),
    );
  }


  void checkAndGoToNextPage() async{
    await Future.delayed(Duration(seconds: 2));
    final prefs = await SharedPreferences.getInstance();
    String city = prefs.getString("city");
    if(city==null){
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => HomeScreen()),
      );
    }else{
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => WeatherScreen(city)),
      );
    }
  }
}
