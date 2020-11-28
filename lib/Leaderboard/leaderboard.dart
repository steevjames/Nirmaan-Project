import 'package:carbonfootprint/Leaderboard/Components/header.dart';
import 'package:carbonfootprint/Leaderboard/Components/leaderboardCard.dart';
import 'package:flutter/material.dart';

class Leaderboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // Zero height appbar: It avoids status bar
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(0.0),
        child: AppBar(
          backgroundColor: Color.fromRGBO(5, 55, 68, 1),
        ),
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Color.fromRGBO(5, 55, 68, 1),
              child: Leaderboardheader(),
            ),
            Stack(
              children: [
                Container(
                  height: 30,
                  color: Color.fromRGBO(5, 55, 68, 1),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(35),
                      topRight: Radius.circular(35),
                    ),
                  ),
                  child: BottomPart(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class BottomPart extends StatelessWidget {
  final List<Map<String, dynamic>> sampleData = [
    {"name": "Steev", "image": "", "points": "123"},
    {"name": "Sneha", "image": "", "points": "122"},
    {"name": "Megha", "image": "", "points": "121"},
    {"name": "Vishnu", "Vishnu": "", "points": "120"},
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 30, 20, 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: List.generate(
          sampleData.length,
          (index) =>
              LeaderboardCard(details: sampleData[index], rank: index + 1),
        ),
      ),
    );
  }
}
