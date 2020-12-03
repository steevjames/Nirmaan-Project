import 'package:carbonfootprint/Components/styling.dart';
import 'package:flutter/material.dart';

Widget generateFoot(context) {
  List<Map<String, dynamic>> data = [
    {"name": "Transportation", "value": 5, "color": Color(0xff8abaae)},
    {"name": "Cooking", "value": 5, "color": Color(0xff5ca08e)},
    {"name": "Air Travel", "value": 5, "color": Color(0xff2e856e)},
    {"name": "Something else", "value": 5, "color": Color(0xff006a4e)},
  ];

// Total value
  int total = 0;
  for (final i in data) {
    total += i["value"];
  }

// List to provide as Color for gradient(which is made to solid lines by giving more stops)
  List<Color> colorList = [];
  for (final i in data) {
    colorList.add(i["color"]);
    colorList.add(i["color"]);
  }

// List to provide as stops to gradient.
  List<double> stopList = [];
  for (int i = 0, tillNow = 0; i < data.length; i++) {
    stopList.add(tillNow / total);
    tillNow += data[i]["value"];
    stopList.add(tillNow / total);
  }

  return IntrinsicHeight(
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(width: MediaQuery.of(context).size.width * .08),
        ShaderMask(
          blendMode: BlendMode.srcIn,
          shaderCallback: (Rect bounds) {
            return LinearGradient(
              colors: colorList,
              stops: stopList,
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              tileMode: TileMode.mirror,
            ).createShader(bounds);
          },
          child: Image(
            width: MediaQuery.of(context).size.width * .28,
            image: AssetImage("assets/foot.png"),
          ),
        ),
        SizedBox(width: 30),
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
                  SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          data[index]["name"],
                          style: TextStyle(color: textColor, fontSize: 13),
                        ),
                        SizedBox(height: 5),
                        Text(
                          data[index]["value"].toString() + " Kg CO2",
                          style: TextStyle(color: textColorLight, fontSize: 10),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
