import 'package:flutter/material.dart';

class ThemeDataApp {
  static ThemeData get lightTheme => ThemeData(
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
          color: Colors.red[700],
          centerTitle: true,
          elevation: 0,
        ),
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.red,
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: 'Raleway',
        textTheme: TextTheme(
          displayLarge: TextStyle(
              fontSize: 30, color: Colors.black, fontWeight: FontWeight.w900),
          displayMedium: TextStyle(
              fontSize: 28, color: Colors.black, fontWeight: FontWeight.w900),
          displaySmall: TextStyle(
              fontSize: 26, color: Colors.black, fontWeight: FontWeight.w900),
          headlineMedium: TextStyle(
              fontSize: 24, color: Colors.black, fontWeight: FontWeight.w700),
          headlineSmall: TextStyle(
              fontSize: 22, color: Colors.black, fontWeight: FontWeight.w700),
          titleLarge: TextStyle(
            fontSize: 18,
            color: Colors.black,
          ),
          titleMedium: TextStyle(
            fontSize: 16,
            color: Colors.black,
          ),
          titleSmall: TextStyle(
            fontSize: 14,
            color: Colors.black,
          ),
          bodyLarge: TextStyle(
            fontSize: 16,
            color: Colors.black,
          ),
          bodyMedium: TextStyle(
            fontSize: 14,
            color: Colors.black,
          ),
          bodySmall: TextStyle(
            fontSize: 12,
            color: Colors.black,
          ),
          labelLarge: TextStyle(
            fontSize: 20,
            color: Colors.black,
          ),
        ),
      );
}
