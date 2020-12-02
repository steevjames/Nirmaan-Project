import 'package:flutter/material.dart';

class HomePageHeader extends StatelessWidget {
  final String userName;
  final String carbonFootprint;
  HomePageHeader({@required this.userName, @required this.carbonFootprint});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Center(
            child: Text(
              "Your average monthly carbon footprint is",
              style: TextStyle(color: Colors.white, fontSize: 23),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                carbonFootprint,
                style: TextStyle(color: Colors.white, fontSize: 35),
              ),
              Text(
                " CO2",
                style: TextStyle(color: Colors.green, fontSize: 35),
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }
}
