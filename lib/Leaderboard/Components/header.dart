import 'package:flutter/material.dart';

class Leaderboardheader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: 15,
          ),
          Center(
            child: Text(
              "Leaderboard",
              style: TextStyle(color: Colors.white, fontSize: 29),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "Here are the top performers this month",
            style: TextStyle(color: Colors.white, fontSize: 20),
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
