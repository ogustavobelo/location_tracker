import 'package:flutter/material.dart';
import 'package:location_tracker/core/themes/themes.dart';
import 'package:location_tracker/presentation/home/home_screen.dart';
import 'package:overlay_support/overlay_support.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return OverlaySupport(
      child: MaterialApp(
        title: 'Location tracker',
        theme: Themes.defaultTheme,
        home: HomeScreen(),
      ),
    );
  }
}
