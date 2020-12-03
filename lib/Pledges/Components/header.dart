import 'package:flutter/material.dart';

class Pledgesheader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: 15,
          ),
          Center(
            child: Text(
              "Pledges",
              style: TextStyle(color: Colors.white, fontSize: 27),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            "Take up these pledges to reduce your carbon footprint.",
            style: TextStyle(color: Colors.white, fontSize: 15),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }
}
