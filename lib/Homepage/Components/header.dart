import 'package:avatar_glow/avatar_glow.dart';
import 'package:carbonfootprint/Components/styling.dart';
import 'package:flutter/material.dart';

class HomePageHeader extends StatelessWidget {
  final String userName;
  final String carbonFootprint;
  HomePageHeader({@required this.userName, @required this.carbonFootprint});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 45, vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 10),
          AvatarGlow(
            endRadius: 75.0,
            glowColor: Colors.white,
            showTwoGlows: true,
            duration: Duration(milliseconds: 2000),
            child: Material(
              elevation: 8.0,
              shape: CircleBorder(),
              child: CircleAvatar(
                radius: 45.0,
                backgroundColor: Colors.grey[100],
                child: Text(
                  "50 Kg",
                  style: TextStyle(
                    color: primaryColor,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 10),
          Center(
            child: Text(
              "is your total carbon emission this month",
              style: TextStyle(color: Colors.white, fontSize: 14),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 25),
        ],
      ),
    );
  }
}
