import 'package:avatar_glow/avatar_glow.dart';
import 'package:carbonfootprint/Components/styling.dart';
import 'package:carbonfootprint/Components/zeroHeightAppbar.dart';
import 'package:carbonfootprint/Homepage/Components/foot.dart';
import 'package:carbonfootprint/Questions2/questionnarePage.dart';
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
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 45, vertical: 5),
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
            child: ElevatedButton(
              child: Text(
                "Take Questionnare",
                style: TextStyle(
                  color: textColor,
                ),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                padding: MaterialStateProperty.all(
                  EdgeInsets.symmetric(
                    horizontal: 50,
                    vertical: 12,
                  ),
                ),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: BorderSide(
                      color: primaryColor,
                    ),
                  ),
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => QuestionnarePage()),
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
