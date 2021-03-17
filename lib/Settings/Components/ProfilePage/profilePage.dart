import 'dart:convert';

import "package:flutter/material.dart";
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  Future userDetails;

  Future getUserDetails() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String details = prefs.getString('userDetails') ?? 1;
    return jsonDecode(details);
  }

  @override
  void initState() {
    userDetails = getUserDetails();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: userDetails,
        builder: (context, snapshot) {
          if (!snapshot.hasData)
            return Center(
              child: CircularProgressIndicator(),
            );
          else {
            var details = snapshot.data;

            // Add code here to change page
            return Column(
              children: [
                SafeArea(child: Center()),
                Image.network(details["photo"]),
                Text(details["name"]),
                Text(details["email"]),
              ],
            );
          }
        },
      ),
    );
  }
}
