import 'package:carbonfootprint/Components/styling.dart';
import 'package:carbonfootprint/Homepage/Components/header.dart';
import 'package:carbonfootprint/Homepage/Components/piechart.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // Zero height appbar: It avoids status bar
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(0.0),
        child: AppBar(
          backgroundColor: primaryColor,
        ),
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: primaryColor,
              child: HomePageHeader(
                userName: "Steev",
                carbonFootprint: "694kg",
              ),
            ),
            Stack(
              children: [
                Container(
                  height: 50,
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
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 30, 20, 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Center(
            child: Text(
              "Your carbon footprint in a nutshell",
              style: TextStyle(
                color: Colors.black87,
                fontSize: 18,
                fontWeight: FontWeight.w400,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          HomePagePieChart(),
        ],
      ),
    );
  }
}
