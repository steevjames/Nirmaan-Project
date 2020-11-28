import 'package:flutter/material.dart';

class SuggestionsPageheader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: 12,
          ),
          Center(
            child: Text(
              "Tips",
              style: TextStyle(color: Colors.white, fontSize: 27),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "Follow these tips to reduce your carbon footprint",
            style: TextStyle(color: Colors.white, fontSize: 17),
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
