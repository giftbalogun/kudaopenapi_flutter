import 'package:flutter/material.dart';

const PrimaryColor = const Color(0xFffb5607);

class MyTheme {
  static final ThemeData defaultTheme = _buildMyTheme();

  static ThemeData _buildMyTheme() {
    final ThemeData base = ThemeData.light();

    return base.copyWith(
      primaryColor: PrimaryColor,
    );
  }
}
