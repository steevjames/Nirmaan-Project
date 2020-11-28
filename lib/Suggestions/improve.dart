import 'package:carbonfootprint/Components/styling.dart';
import 'package:carbonfootprint/Components/zeroHeightAppbar.dart';
import 'package:carbonfootprint/Suggestions/Components/header.dart';
import 'package:flutter/material.dart';

class SuggestionsPage extends StatelessWidget {
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
              child: SuggestionsPageheader(),
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
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(20, 30, 20, 5),
        child: Column(
          children: [
            Tip(
              heading: "Use public transportation",
              image:
                  "https://image.freepik.com/free-vector/passengers-waiting-bus-city-queue-town-road-flat-vector-illustration-public-transport-urban-lifestyle_74855-8493.jpg",
            ),
            Tip(
              heading: "Use less water",
              image: "https://pngimg.com/uploads/water/water_PNG50184.png",
            ),
          ],
        ));
  }
}

class Tip extends StatelessWidget {
  final String image;
  final String heading;
  Tip({@required this.image, @required this.heading});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              width: MediaQuery.of(context).size.width * .7,
              image: NetworkImage(image),
            )
          ],
        ),
        SizedBox(height: 10),
        Text(
          heading,
          style: TextStyle(
            color: textColor,
            fontSize: 18,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 15),
        Text(
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco.",
          style: TextStyle(
            color: textColorLight,
            fontSize: 13,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 15),
        Divider(thickness: 1),
        SizedBox(height: 15),
      ],
    );
  }
}
