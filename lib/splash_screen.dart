import 'dart:async';
import 'package:flutter/material.dart';
import 'package:law/signup.dart';

import 'Homepage.dart';
import 'Registration.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      // Replace the 'HomeScreen()' with your desired main screen widget
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Replace this with your desired logo or image widget
            Image.asset(
              'images/splash.png',
              width: 150.0,
              height: 150.0,
            ),
            SizedBox(height: 16.0),
            Text(
              'My App',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}