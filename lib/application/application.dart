import 'package:flutter/material.dart';
import 'package:flutter_counter_app/application/theme/app_theme.dart';
import 'package:flutter_counter_app/presentation/home/home_screen.dart';

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      darkTheme: ThemeData.dark(
        useMaterial3: true,
      ),
      theme: buildTheme(),
      home: const HomeScreen(),
    );
  }
}
