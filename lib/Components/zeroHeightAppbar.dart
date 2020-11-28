import 'package:flutter/material.dart';

zeroHeightAppbar() {
  // Zero height appbar is used to avoid content from status bar in a clean way
  return PreferredSize(
    preferredSize: Size.fromHeight(0.0),
    child: AppBar(
      backgroundColor: Color.fromRGBO(5, 55, 68, 1),
    ),
  );
}
