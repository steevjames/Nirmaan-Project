import 'package:carbonfootprint/Navigation/navigation.dart';
import 'package:flutter/material.dart';
// import 'package:carbonfootprint/Sample Page/samplePage.dart';

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
      home: NavigationBar(),
    );
  }
}
