import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:location_tracker/core/data_injection/injectable.dart';
import 'package:location_tracker/data/models/location_model.dart';
import 'package:location_tracker/presentation/shared/controller/app_controller.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _appController = getIt<AppController>();

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Home Screen'),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  '${_appController.location?.latitude ?? 'nulo'}',
                ),
                Text(
                  '${_appController.location?.longitude ?? 'nulo'}',
                ),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () async {
              _appController.setLocation();
            },
            tooltip: 'Increment',
            child: Icon(Icons.add),
          ),
        );
      }, // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
