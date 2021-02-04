// import 'package:carbonfootprint/Homepage/homepage.dart';
// import 'package:carbonfootprint/Login/login.dart';
import 'package:carbonfootprint/Navigation/navigation.dart';
import 'package:flutter/material.dart';
import 'package:carbonfootprint/Intro/intro.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Carbon Footprint Tracker',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: OnBoardingPage(),
    );
  }
}
