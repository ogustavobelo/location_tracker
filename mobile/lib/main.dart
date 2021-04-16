import 'package:flutter/material.dart';
import 'package:location_tracker/presentation/my_app.dart';
import 'package:location_tracker/core/data_injection/injectable.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await di.init();

  runApp(MyApp());
}
