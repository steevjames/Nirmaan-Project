import 'package:carbonfootprint/Components/styling.dart';
import 'package:flutter/material.dart';

class LeaderboardCard extends StatelessWidget {
  final Map<String, dynamic> details;
  final int rank;
  LeaderboardCard({@required this.details, @required this.rank});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 0, vertical: 10),
      padding: EdgeInsets.fromLTRB(5, 7, 20, 7),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              blurRadius: 7,
              spreadRadius: -2,
              color: Colors.grey,
              offset: Offset(1, 2))
        ],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          SizedBox(width: 10),
          CircleAvatar(
            backgroundColor: Colors.black12,
            radius: 19,
            child: Text(
              "$rank",
              style: TextStyle(color: textColorLight, fontSize: 15),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(width: 15),
          Expanded(
            child: Text(
              details["name"],
              style: TextStyle(color: textColorLight, fontSize: 15),
              textAlign: TextAlign.left,
            ),
          ),
          Text(
            details["points"] + " Points",
            style: TextStyle(color: lightGreen, fontSize: 14),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
