// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

ThemeData theme() {
  return ThemeData(
    scaffoldBackgroundColor: Colors.white,
    fontFamily: 'Avenir',
    textTheme: textTheme(),
  );
}

TextTheme textTheme() {
  return TextTheme(
    headline1: TextStyle(
        color: Colors.black, fontSize: 32.0, fontWeight: FontWeight.bold),
    headline2: TextStyle(
        color: Colors.black, fontSize: 24.0, fontWeight: FontWeight.bold),
    headline3: TextStyle(
        color: Colors.black, fontSize: 18.0, fontWeight: FontWeight.bold),
    headline4: TextStyle(
        color: Colors.black, fontSize: 16.0, fontWeight: FontWeight.bold),
    headline5: TextStyle(
        color: Colors.black, fontSize: 14.0, fontWeight: FontWeight.bold),
    headline6: TextStyle(
        color: Colors.black, fontSize: 14.0, fontWeight: FontWeight.bold),
    bodyText1: TextStyle(
        color: Colors.black, fontSize: 12.0, fontWeight: FontWeight.bold),
    bodyText2: TextStyle(
        color: Colors.black, fontSize: 10.0, fontWeight: FontWeight.bold),
  );
}
