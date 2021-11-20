import 'package:flutter/material.dart';

import 'utils/utils.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Task Manager app',
      theme: ThemeData(
        brightness: Brightness.dark,
        appBarTheme: const AppBarTheme().copyWith(backgroundColor: black),
        scaffoldBackgroundColor: scaffoldBackgroundColor,
        backgroundColor: backgroundColor,
        primaryColor: primaryColor,
        accentColor: accentColor,
        iconTheme: const IconThemeData().copyWith(color: white),
        fontFamily: 'Poppins',
        textTheme: TextTheme(
          headline2: TextStyle(
            color: headlineTextColor,
            fontWeight: FontWeight.bold,
          ),
          headline4: TextStyle(
            color: bodyTextColor,
            fontWeight: FontWeight.w600,
            letterSpacing: 2.0,
          ),
          bodyText1: TextStyle(
            color: bodyTextColor,
            fontWeight: FontWeight.w500,
            letterSpacing: 1.0,
          ),
          bodyText2: TextStyle(
            color: bodyTextColor,
            fontWeight: FontWeight.w400,
            letterSpacing: 1.0,
          ),
        ),
      ),
    );
  }
}
