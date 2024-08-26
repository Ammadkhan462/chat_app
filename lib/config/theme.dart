import 'package:flutter/material.dart';
import 'package:chat_app/config/colors.dart';

var lightTheme = ThemeData();
var darkTheme = ThemeData(
    appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(
        // Set the default color for icons in the AppBar
        color: donBackgroundColor, // Replace with your desired color
      ),
      backgroundColor: dContainercolor,
      actionsIconTheme: IconThemeData(
        color: donBackgroundColor, // Default color for actions' icons
      ),
      toolbarTextStyle: TextStyle(
        color: donBackgroundColor, // Default color for other text elements
        fontSize: 18,
        fontWeight: FontWeight.w500,
        fontFamily: "Poppins",
      ),
    ),
    brightness: Brightness.dark,
    useMaterial3: true,
    inputDecorationTheme: InputDecorationTheme(
      fillColor: dBackgroundColor,
      filled: true,
      border: UnderlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(10),
      ),
    ),
    colorScheme: ColorScheme.dark(
      brightness: Brightness.dark,
      primary: dPrimarycolor,
      onPrimary: donBackgroundColor,
      surface: dBackgroundColor,
      onSurface: dContainercolor,
      primaryContainer: doncontainercolor,
    ),
    textTheme: TextTheme(
      bodyLarge: TextStyle(
        fontSize: 18,
        color: donBackgroundColor,
        fontFamily: "Poppins",
        fontWeight: FontWeight.w500,
      ),
      bodyMedium: TextStyle(
        fontSize: 15,
        color: donBackgroundColor,
        fontFamily: "Poppins",
        fontWeight: FontWeight.w500,
      ),
      headlineLarge: TextStyle(
        fontSize: 32,
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w800,
        color: dPrimarycolor,
      ),
      headlineMedium: TextStyle(
        fontSize: 30,
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w600,
        color: donBackgroundColor,
      ),
      headlineSmall: TextStyle(
        fontSize: 20,
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w600,
        color: dPrimarycolor,
      ),
      labelLarge: TextStyle(
        fontSize: 15,
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w400,
        color: doncontainercolor,
      ),
      labelMedium: TextStyle(
        fontSize: 12,
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w400,
        color: doncontainercolor,
      ),
      labelSmall: TextStyle(
        fontSize: 12,
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w300,
        color: doncontainercolor,
      ),
    ));
