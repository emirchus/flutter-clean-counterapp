import 'package:flutter/material.dart';

ThemeData buildTheme() {
  return ThemeData(
    brightness: Brightness.light,
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
    useMaterial3: true,
  );
}
