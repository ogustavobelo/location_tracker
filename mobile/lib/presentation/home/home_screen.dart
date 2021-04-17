import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:location_tracker/core/data_injection/injectable.dart';
import 'package:location_tracker/core/error/exceptions.dart';
import 'package:location_tracker/core/notifications/notification_service.dart';
import 'package:location_tracker/presentation/shared/components/location_loading_component.dart';
import 'package:location_tracker/presentation/shared/controller/app_controller.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _appController = getIt<AppController>();

  @override
  void initState() {
    _initPermissions();
    super.initState();
  }

  void _initPermissions() async {
    try {
      await _appController.requestServiceLocation();
      await _appController.requestPermission();
      _appController.setLocation();
    } catch (e) {
      final _errorMessage =
          e is LocationException ? e.message : "Unable to get Permissions";
      AppNotifications.showToastError(_errorMessage);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Home Screen'),
          ),
          body: Center(
            child: _appController.loading
                ? LocationLoading()
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        '${_appController.location?.latitude ?? 'empty'}',
                      ),
                      Text(
                        '${_appController.location?.longitude ?? 'empty'}',
                      ),
                    ],
                  ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: _appController.loading
                ? null
                : () async {
                    _appController.setLocation();
                  },
            tooltip: 'Get Current Location',
            backgroundColor: Theme.of(context).primaryColor,
            child: Icon(Icons.pin_drop_sharp),
          ),
        );
      }, // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
