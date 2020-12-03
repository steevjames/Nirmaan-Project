import 'package:carbonfootprint/Components/styling.dart';
import 'package:carbonfootprint/Components/zeroHeightAppbar.dart';
import 'package:carbonfootprint/Pledges/Components/header.dart';
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
              child: Pledgesheader(),
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
  final List<Map<String, dynamic>> pledges = [
    {
      "heading": "Use less water",
      "description":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco.",
      "image":
          "https://image.freepik.com/free-vector/tiny-woman-pouring-clean-water-from-faucet-with-mountain-landscape_74855-11024.jpg",
    },
    {
      "heading": "Reduce wastage of food",
      "description":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco.",
      "image":
          "https://image.freepik.com/free-vector/pile-decaying-garbage-left-lying-around_87689-244.jpg",
    },
    {
      "heading": "Use public transportation",
      "description":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco.",
      "image":
          "https://image.freepik.com/free-vector/passengers-waiting-bus-city-queue-town-road-flat-vector-illustration-public-transport-urban-lifestyle_74855-8493.jpg",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(5, 30, 5, 5),
        child: CarouselSlider(
          options: CarouselOptions(
            viewportFraction: .9,
            height: 370,
            autoPlay: true,
            enlargeCenterPage: true,
          ),
          items: pledges.map((i) {
            return Builder(
              builder: (BuildContext context) {
                return SingleChildScrollView(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.symmetric(horizontal: 5.0),
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 5,
                          spreadRadius: -5,
                          color: Colors.black38,
                          offset: Offset(5, 5),
                        )
                      ],
                      color: Colors.white,
                    ),
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
                          image: NetworkImage(i["image"]),
                        ),
                        SizedBox(height: 15),
                        Text(
                          i["description"],
                          style: TextStyle(fontSize: 14, color: textColorLight),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }).toList(),
        ));
  }
}
