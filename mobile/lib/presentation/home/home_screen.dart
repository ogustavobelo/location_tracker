import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:location_tracker/core/constants/fonts.dart';
import 'package:location_tracker/core/data_injection/injectable.dart';
import 'package:location_tracker/core/error/exceptions.dart';
import 'package:location_tracker/core/helpers/i18n_helper.dart';
import 'package:location_tracker/core/notifications/notification_service.dart';
import 'package:location_tracker/presentation/home/components/vehicle_picker_component.dart';
import 'package:location_tracker/presentation/shared/components/hard_edge_button.dart';
import 'package:location_tracker/presentation/shared/components/hard_edge_textfield.dart';
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
      // await _appController.setLocation();
    } catch (e) {
      final _errorMessage =
          e is LocationException ? e.message : "Unable to get Permissions";
      AppNotifications.showToastError(_errorMessage);
    }
  }

  String _translate(String key) {
    return I18nHelper.translate(context, "home.$key");
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        return Scaffold(
          appBar: AppBar(
            title: Text(_translate("appBarTitle")),
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            elevation: 0.0,
          ),
          body: _appController.loading
              ? LocationLoading()
              : ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  shrinkWrap: true,
                  children: <Widget>[
                    Row(
                      children: [
                        Text('Nick'),
                        const SizedBox(width: 8.0),
                        Expanded(
                          child: HardEdgeTextField(
                            controller: TextEditingController(),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16.0),
                    Text(
                      _translate("chooseVehicle"),
                      style: TextStyle(
                          fontFamily: Fonts.pressStart, color: Colors.black),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 8.0),
                    VehiclePicker(),
                    const SizedBox(height: 16.0),
                    HardEdgeButton(
                      text: 'CREATE',
                      onPressed: () {},
                    ),
                  ],
                ),
          // floatingActionButton: FloatingActionButton(
          //   onPressed: _appController.loading
          //       ? null
          //       : () async {
          //           _appController.setLocation();
          //         },
          //   tooltip: 'Get Current Location',
          //   backgroundColor: Theme.of(context).primaryColor,
          //   child: Icon(Icons.pin_drop_sharp),
          // ),
        );
      }, // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
