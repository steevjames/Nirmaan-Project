import 'package:carbonfootprint/Components/styling.dart';
import 'package:carbonfootprint/Components/zeroHeightAppbar.dart';
import 'package:carbonfootprint/Leaderboard/Components/header.dart';
import 'package:carbonfootprint/Leaderboard/Components/leaderboardCard.dart';
import 'package:flutter/material.dart';

class Leaderboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: zeroHeightAppbar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: primaryColor,
              child: Leaderboardheader(),
            ),
            Stack(
              children: [
                Container(
                  height: 30,
                  color: primaryColor,
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
