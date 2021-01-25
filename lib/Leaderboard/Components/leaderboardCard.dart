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
      padding: EdgeInsets.fromLTRB(5, 10, 20, 10),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              blurRadius: 4,
              spreadRadius: -1,
              color: Colors.grey,
              offset: Offset(1, 2))
        ],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          SizedBox(width: 10),
          CircleAvatar(
            backgroundColor: Color(0xffeeeeee),
            radius: 18,
            child: Text(
              "$rank",
              style: TextStyle(color: textColor, fontSize: 15),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(width: 15),
          Expanded(
            child: Text(
              details["name"],
              style: TextStyle(color: textColor, fontSize: 15),
              textAlign: TextAlign.left,
            ),
          ),
          Text(
            details["points"] + " Kg",
            style: TextStyle(color: Colors.green[700], fontSize: 13),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
