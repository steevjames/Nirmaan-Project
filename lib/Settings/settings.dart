import 'package:carbonfootprint/Settings/Components/settingCard.dart';
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
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 30, 20, 5),
      child: Column(
        children: <Widget>[
          SettingOption(
            optionName: "Profile",
            icon: Icons.person,
            onClick: () {},
          ),
          SettingOption(
            optionName: "About",
            icon: Icons.help,
            onClick: () {},
          ),
          SettingOption(
            optionName: "Change Default",
            icon: Icons.edit,
            onClick: () {},
          ),
          SettingOption(
            optionName: "Logout",
            icon: Icons.logout,
            onClick: () {
              signOutGoogle();
            },
          ),
        ],
      ),
    );
  }
}
