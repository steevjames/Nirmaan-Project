import 'package:carbonfootprint/Components/styling.dart';
import 'package:carbonfootprint/Homepage/Components/header.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // Zero height appbar: It avoids status bar
      appBar: AppBar(
        backgroundColor: primaryColor,
        elevation: 0,
        title: Text("Hello Steev,"),
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
          generateFoot(context),
        ],
      ),
    );
  }
}

Widget generateFoot(context) {
  List<Map<String, dynamic>> data = [
    {"name": "Transportation", "value": 5, "color": Colors.greenAccent},
    {"name": "Cooking", "value": 5, "color": Colors.green},
    {"name": "Air Travel", "value": 5, "color": Colors.lightGreen},
    {"name": "Something else", "value": 5, "color": Colors.grey},
  ];
  var total = 0;
  for (final i in data) {
    total += i["value"];
  }

  List<Color> colorList = [];
  for (final i in data) {
    colorList.add(i["color"]);
    colorList.add(i["color"]);
  }

  List stopList = [];

  var tillNow = data[0]["value"] ~/ total;
  stopList.add(tillNow / total);
  for (int i = 1; i < data.length - 1; i++) {
    tillNow += data[i]["value"];
    stopList.add(tillNow / total);
    stopList.add(tillNow / total);
  }
  stopList.add((tillNow + data[data.length - 1]["value"]) / total);

  print(stopList);
  return IntrinsicHeight(
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ShaderMask(
          blendMode: BlendMode.srcIn,
          shaderCallback: (Rect bounds) {
            return LinearGradient(
              colors: colorList,
              stops: [
                0 / total,
                5 / total,
                5 / total,
                10 / total,
                10 / total,
                15 / total,
                15 / total,
                20 / total,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              tileMode: TileMode.mirror,
            ).createShader(bounds);
          },
          child: Image(
            width: MediaQuery.of(context).size.width * .3,
            image: AssetImage("assets/foot.png"),
          ),
        ),
        SizedBox(width: 20),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: List.generate(
              data.length,
              (index) => Row(
                children: [
                  CircleAvatar(
                    radius: 7,
                    backgroundColor: data[index]["color"],
                  ),
                  SizedBox(width: 5),
                  Text(data[index]["name"])
                ],
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
