import 'package:carbonfootprint/Components/styling.dart';
import "package:flutter/material.dart";

class SettingOption extends StatelessWidget {
  final String optionName;
  final IconData icon;
  final Function onClick;
  SettingOption({this.optionName, this.icon, this.onClick});
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      color: Colors.white,
      margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
      child: InkWell(
        onTap: onClick,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            children: [
              Icon(icon, color: textColorLight),
              SizedBox(width: 17),
              Text(
                optionName ?? "",
                style: TextStyle(
                  color: textColor,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
