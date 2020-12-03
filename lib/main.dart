import 'package:carbonfootprint/Navigation/navigation.dart';
import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:carbonfootprint/Login/login.dart';
=======
>>>>>>> 96525f477abd202897f82ec5660ef497bbb61e11

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
<<<<<<< HEAD
        title: 'Carbon Footprint Tracker',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: NavigationBar() // SignInDemo(),
        );
=======
      title: 'Carbon Footprint Tracker',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: NavigationBar(),
    );
>>>>>>> 96525f477abd202897f82ec5660ef497bbb61e11
  }
}
