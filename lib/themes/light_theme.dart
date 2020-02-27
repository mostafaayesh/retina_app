import 'package:flutter/material.dart';


final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  cardTheme: CardTheme(
    color: Colors.black,
  ),
  primaryTextTheme: Typography().white,
  textTheme: Typography().white,
  appBarTheme: AppBarTheme(
    brightness: Brightness.light,
    color: Colors.white,
    textTheme: Typography().black.merge(
          TextTheme(
            title: TextStyle(fontFamily: "Montserrat", fontSize: 24.0),
          ),
        ),
    elevation: 0.0, // Removes the bottom shadow
    iconTheme: IconThemeData(color: Colors.black),
    actionsIconTheme: IconThemeData(color: Colors.black),
  ),
  backgroundColor: Colors.white,
  scaffoldBackgroundColor: Colors.white,
  iconTheme: IconThemeData(
    color: Colors.white,
  ),
);
