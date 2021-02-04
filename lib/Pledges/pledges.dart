import 'package:carbonfootprint/Components/styling.dart';
import 'package:carbonfootprint/Components/zeroHeightAppbar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class Pledges extends StatelessWidget {
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
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: Text(
                        "Pledges",
                        style: TextStyle(color: Colors.white, fontSize: 27),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Take up these pledges to reduce your \ncarbon footprint.",
                      style: TextStyle(color: Colors.white, fontSize: 14),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ),
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

class BottomPart extends StatefulWidget {
  @override
  _BottomPartState createState() => _BottomPartState();
}

class _BottomPartState extends State<BottomPart> {
  int sliderIndex = 0;
  final List<Map<String, dynamic>> pledges = [
    {
      "heading": "Use less water",
      "description":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco.",
      "image": "water.jpg",
    },
    {
      "heading": "Reduce wastage of food",
      "description":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco.",
      "image": "food.jpg",
    },
    {
      "heading": "Use public transportation",
      "description":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco.",
      "image": "bus.jpg",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(5, 30, 5, 5),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                pledges.length,
                (index) => Padding(
                  padding: EdgeInsets.all(2),
                  child: CircleAvatar(
                    radius: 3,
                    backgroundColor:
                        index == sliderIndex ? Colors.green : Colors.black12,
                  ),
                ),
              ),
            ),
            CarouselSlider(
              options: CarouselOptions(
                viewportFraction: .9,
                height: 370,
                autoPlay: true,
                enlargeCenterPage: true,
                onPageChanged: (index, _) {
                  setState(() {
                    sliderIndex = index;
                  });
                },
              ),
              items: pledges.map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return SingleChildScrollView(
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(horizontal: 5.0),
                        padding: EdgeInsets.all(15),
                        child: Column(
                          children: [
                            Text(
                              i["heading"],
                              style: TextStyle(color: textColor, fontSize: 19),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 5),
                            Image(
                              width: MediaQuery.of(context).size.width * .6,
                              image: AssetImage(
                                "assets/pledges/" + i["image"],
                              ),
                            ),
                            SizedBox(height: 15),
                            Text(
                              i["description"],
                              style: TextStyle(
                                fontSize: 14,
                                color: textColorLight,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              }).toList(),
            ),
          ],
        ));
  }
}
