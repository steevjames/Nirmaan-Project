import 'dart:convert';
import 'package:carbonfootprint/Login/login.dart';
import 'package:carbonfootprint/Settings/Components/settingCard.dart';
import 'package:flutter/material.dart';
import 'package:carbonfootprint/Components/styling.dart';
import 'package:carbonfootprint/Components/zeroHeightAppbar.dart';
import 'package:carbonfootprint/Login/authentication.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  Future userDetails;

  Future getUserDetails() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String details = prefs.getString('userDetails') ?? 1;
    return jsonDecode(details);
  }

  logOut() {
    signOutGoogle();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) {
          return LoginPage(autoLogin: false);
        },
      ),
    );
  }

  logOutConfirmation() async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Do you want to Logout ?',
            style: TextStyle(fontSize: 16, color: primaryColor),
          ),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          actions: <Widget>[
            TextButton(
              child: Text(
                "Yes",
                style: TextStyle(fontSize: 14.5, color: primaryColor),
              ),
              onPressed: () {
                Navigator.pop(context);
                logOut();
              },
            ),
            TextButton(
              child: Text(
                "Cancel",
                style: TextStyle(fontSize: 14.5, color: primaryColor),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  void initState() {
    userDetails = getUserDetails();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: zeroHeightAppbar(),
      body: SingleChildScrollView(
        child: FutureBuilder(
          future: userDetails,
          builder: (context, snapshot) {
            if (!snapshot.hasData)
              return Center(
                child: CircularProgressIndicator(),
              );
            else {
              // User details
              var details = snapshot.data;
              return Column(
                children: [
                  Container(
                    color: primaryColor,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 40,
                      vertical: 20,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        SafeArea(
                          child: Center(),
                        ),
                        SizedBox(height: 20),
                        Text(
                          "Profile",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 50),
                      ],
                    ),
                  ),
                  Stack(
                    children: [
                      Container(
                        height: 30,
                        color: primaryColor,
                      ),
                      Container(
                        padding: const EdgeInsets.fromLTRB(20, 30, 20, 5),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(35),
                            topRight: Radius.circular(35),
                          ),
                        ),
                        child: Column(
                          children: <Widget>[
                            // Photo
                            Container(
                              width: 75.0,
                              height: 75.0,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(
                                    details['photo'],
                                  ),
                                  fit: BoxFit.cover,
                                ),
                                color: Colors.blue,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(100.0),
                                ),
                              ),
                            ),
                            SizedBox(height: 20),
                            Center(
                              child: Text(
                                "You are logged in as:\n",
                                style: TextStyle(
                                  color: textColorLight,
                                  fontSize: 15,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Text(
                              details["name"],
                              style: TextStyle(
                                color: textColor,
                                fontSize: 17,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 6),
                            Text(
                              details["email"],
                              style: TextStyle(
                                color: Colors.black45,
                                fontSize: 13,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 90),
                            SettingOption(
                              optionName: "Logout",
                              icon: Icons.logout,
                              onClick: () {
                                logOutConfirmation();
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
