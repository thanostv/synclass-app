import 'package:flutter/material.dart';

final theme = ThemeData(
  checkboxTheme: CheckboxThemeData(
    fillColor: MaterialStateColor.resolveWith((states) {
      if(states.contains(MaterialState.selected)) {
          return const Color(0xff3C68DA);
        }

      return Colors.white;
    })
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xff5271FF),
    iconTheme: IconThemeData(color: Colors.white),
    foregroundColor: Colors.white
  ),
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: const Color(0xffF5F0F0),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
      borderSide: const BorderSide(width: 0, style: BorderStyle.none),
    ),
    isDense: true,
    contentPadding: const EdgeInsets.fromLTRB(14, 8, 10, 8),
    hintStyle: TextStyle(
      color: Colors.black.withOpacity(0.25)
    )
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      foregroundColor: Colors.white,
      backgroundColor: const Color(0xff3C68DA),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10)
      )
    )
  )
);