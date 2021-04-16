import 'package:flutter/material.dart';
import 'package:location_tracker/core/themes/themes.dart';
import 'package:location_tracker/presentation/home/home_screen.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Location tracker',
      theme: Themes.defaultTheme,
      home: HomeScreen(),
    );
  }
}
