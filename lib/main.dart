import 'package:flutter/material.dart';
import 'package:carbonfootprint/Sample Page/samplePage.dart';
import 'package:carbonfootprint/Intro/intro.dart';
import 'package:carbonfootprint/Login/login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Carbon Footprint Tracker',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SignInDemo(),
    );
  }
}
