import 'package:flutter/material.dart';
import 'package:flutter_counter_app/application/theme/app_theme.dart';

Widget buildPreview(BuildContext context, Widget child) {
  return MaterialApp(
    themeMode: ThemeMode.system,
    darkTheme: ThemeData.dark(
      useMaterial3: true,
    ),
    theme: buildTheme(),
    home: child,
  );
}
