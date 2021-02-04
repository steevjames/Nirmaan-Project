import 'package:carbonfootprint/Components/styling.dart';
import 'package:flutter/material.dart';

zeroHeightAppbar({Color color}) {
  // Zero height appbar is used to avoid content from status bar in a clean way
  return PreferredSize(
    preferredSize: Size.fromHeight(0.0),
    child: AppBar(
      backgroundColor: color ?? primaryColor,
    ),
  );
}
