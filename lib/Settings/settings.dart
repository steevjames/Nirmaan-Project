import 'package:carbonfootprint/Login/login.dart';
import 'package:carbonfootprint/Settings/Components/settingCard.dart';
import 'package:carbonfootprint/Settings/Components/ProfilePage/profilePage.dart';
import 'package:flutter/material.dart';
import 'package:carbonfootprint/Components/styling.dart';
import 'package:carbonfootprint/Components/zeroHeightAppbar.dart';
import 'package:carbonfootprint/Login/authentication.dart';

class Settings extends StatelessWidget {
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
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(
                      height: 12,
                    ),
                    Center(
                      child: Text(
                        "Settings",
                        style: TextStyle(color: Colors.white, fontSize: 27),
                        textAlign: TextAlign.center,
                      ),
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

class BottomPart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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

    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 30, 20, 5),
      child: Column(
        children: <Widget>[
          SettingOption(
            optionName: "Profile",
            icon: Icons.person,
            onClick: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return ProfilePage();
                  },
                ),
              );
            },
          ),
          SettingOption(
            optionName: "About",
            icon: Icons.help,
            onClick: () {},
          ),
          SettingOption(
            optionName: "Anathor option",
            icon: Icons.edit,
            onClick: () {},
          ),
          SettingOption(
            optionName: "Logout",
            icon: Icons.logout,
            onClick: () {
              logOutConfirmation();
            },
          ),
        ],
      ),
    );
  }
}
