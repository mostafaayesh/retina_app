import 'package:flutter/material.dart';

final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  cardTheme: CardTheme(
    color: Colors.white,
  ),
  primaryTextTheme: Typography().black,
  textTheme: Typography().black,
  appBarTheme: AppBarTheme(
    brightness: Brightness.dark,
    color: Colors.black,
    textTheme: Typography().white.merge(
          TextTheme(
            title: TextStyle(fontFamily: "Montserrat", fontSize: 24.0),
          ),
        ),
    elevation: 0.0, // Removes the bottom shadow
  ),
  backgroundColor: Colors.black,
  scaffoldBackgroundColor: Colors.black,
  iconTheme: IconThemeData(
    color: Colors.black,
  ),
);
