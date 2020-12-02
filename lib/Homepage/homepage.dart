import 'package:carbonfootprint/Components/styling.dart';
import 'package:carbonfootprint/Components/zeroHeightAppbar.dart';
import 'package:carbonfootprint/Homepage/Components/foot.dart';
import 'package:carbonfootprint/Homepage/Components/header.dart';
import 'package:carbonfootprint/Questions/questions.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      // Zero height appbar: It avoids status bar
      appBar: zeroHeightAppbar(),

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
          generateFoot(context),
          SizedBox(height: 25),
          Center(
            child: RaisedButton(
              child: Text(
                "Take Questionnare",
                style: TextStyle(
                  color: textColor,
                ),
              ),
              color: Colors.white,
              padding: EdgeInsets.symmetric(
                horizontal: 50,
                vertical: 12,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
                side: BorderSide(
                  color: primaryColor,
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Question()),
                );
              },
            ),
          ),
          SizedBox(height: 30),
        ],
      ),
    );
  }
}
