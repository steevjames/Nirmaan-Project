import 'package:flutter/material.dart';
import 'package:carbonfootprint/Components/styling.dart';
import 'package:carbonfootprint/Components/zeroHeightAppbar.dart';
import 'package:carbonfootprint/Settings/Components/header.dart';

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
              child: SettingsHeader(),
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
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              color: Colors.white,
              margin: const EdgeInsets.all(8.0),
              child: ListTile(
                onTap: () {
                  // to implement
                },
                title: Text(
                  'Profile',
                  style:
                      TextStyle(color: textColor, fontWeight: FontWeight.bold),
                ),
                leading: Icon(Icons.person),
              ),
            ),
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              color: Colors.white,
              margin: const EdgeInsets.all(8.0),
              child: ListTile(
                onTap: () {
                  // to implement
                },
                title: Text(
                  'About',
                  style:
                      TextStyle(color: textColor, fontWeight: FontWeight.bold),
                ),
                leading: Icon(Icons.help),
              ),
            ),
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              color: Colors.white,
              margin: const EdgeInsets.all(8.0),
              child: ListTile(
                onTap: () {
                  // to implement
                },
                title: Text(
                  'Change default',
                  style:
                      TextStyle(color: textColor, fontWeight: FontWeight.bold),
                ),
                leading: Icon(Icons.edit),
              ),
            ),
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              color: Colors.white,
              margin: const EdgeInsets.all(8.0),
              child: ListTile(
                onTap: () {
                  // to implement
                },
                title: Text(
                  'Logout',
                  style:
                      TextStyle(color: textColor, fontWeight: FontWeight.bold),
                ),
                leading: Icon(Icons.logout),
              ),
            ),
          ],
        ));
  }
}
