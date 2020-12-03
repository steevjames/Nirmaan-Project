import 'package:flutter/material.dart';

class Leaderboardheader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: 12,
          ),
          Center(
            child: Text(
              "Leaderboard",
              style: TextStyle(color: Colors.white, fontSize: 27),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "Here are the top performers of \nthis month",
            style: TextStyle(color: Colors.white, fontSize: 15),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }
}
