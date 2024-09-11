import 'package:flutter/material.dart';

// Light Theme
final lightTheme = ThemeData(
  primarySwatch: Colors.teal,
  brightness: Brightness.light,
  scaffoldBackgroundColor:  const Color(0xffF6F7FF),
  appBarTheme:  AppBarTheme(
    // color: Color(0xff11283A), // Light theme AppBar color
    backgroundColor: Color(0xff11283A),
    iconTheme: IconThemeData(color: Colors.white),  // Set icons to black
    titleTextStyle: TextStyle(color: Colors.white),  // Set title text to black
  ),
);

// Dark Theme
final darkTheme = ThemeData(
  primarySwatch: Colors.teal,
  brightness: Brightness.dark,
  scaffoldBackgroundColor:  Color(0xff1F1F1F),
  // 0xff2C2C2C
  appBarTheme:  AppBarTheme(
    // color: Colors.black,  // Dark theme AppBar color
    backgroundColor: Color(0xff1F1F1F),  // Dark theme AppBar color
    iconTheme: IconThemeData(color: Colors.white),  // Set icons to white
    titleTextStyle: TextStyle(color: Colors.white),  // Set title text to white
  ),
);
