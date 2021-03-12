import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
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
}
