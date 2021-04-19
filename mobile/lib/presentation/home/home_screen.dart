import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:location_tracker/core/constants/fonts.dart';
import 'package:location_tracker/core/data_injection/injectable.dart';
import 'package:location_tracker/core/error/exceptions.dart';
import 'package:location_tracker/core/helpers/i18n_helper.dart';
import 'package:location_tracker/core/notifications/notification_service.dart';
import 'package:location_tracker/domain/entities/location_entity.dart';
import 'package:location_tracker/domain/entities/vehicle_enum.dart';
import 'package:location_tracker/presentation/home/components/vehicle_picker_component.dart';
import 'package:location_tracker/presentation/map/map_screen.dart';
import 'package:location_tracker/presentation/shared/components/hard_edge_button.dart';
import 'package:location_tracker/presentation/shared/components/hard_edge_textfield.dart';
import 'package:location_tracker/presentation/shared/components/location_loading_component.dart';
import 'package:location_tracker/presentation/shared/controller/app_controller.dart';
import 'package:location_tracker/presentation/shared/controller/user_controller.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _appController = getIt<AppController>();
  final _userController = getIt<UserController>();
  final TextEditingController _nickController = TextEditingController();
  Vehicle _selectedVehicle = Vehicle.car;

  @override
  void initState() {
    _initPermissions();
    super.initState();
  }

  @override
  void dispose() {
    _nickController.dispose();
    super.dispose();
  }

  String _translate(String key) {
    return I18nHelper.translate(context, "home.$key");
  }

  Future<void> _initPermissions() async {
    try {
      await _appController.requestServiceLocation();
      await _appController.requestPermission();
    } catch (e) {
      final _errorMessage = e is LocationException
          ? e.message
          : _translate('errors.unablePermission');
      AppNotifications.showToastError(_errorMessage);
    }
  }

  Future<Location> _getCurrentLocation() async {
    try {
      await _initPermissions();
      final currentLocation = await _appController.getLocation();
      if (currentLocation == null)
        throw LocationException("Unable to get current location");
      return _appController.location!;
    } catch (exception) {
      throw exception;
    }
  }

  void setChoosedVehicle(Vehicle choosed) {
    setState(() => _selectedVehicle = choosed);
  }

  void _createUser() async {
    if (!_validateCreation) return;

    try {
      _appController.startLoading(message: 'Creating User...');
      final currentLocation = await _getCurrentLocation();
      await _userController.createUser(
        params: UserCreateParams(
          vehicle: _selectedVehicle,
          name: _nickController.text,
          location: currentLocation,
        ),
        translate: _translate,
      );
      AppNotifications.showToastSuccess(_translate('success.userCreated'));
      _goToMap();
    } on UserException catch (exception) {
      AppNotifications.showToastError(exception.message);
    } catch (exception) {
      final String message = exception is Exception
          ? exception.message
          : _translate('errors.unexpected');
      AppNotifications.showToastError(message);
    } finally {
      _appController.stopLoading();
    }
  }

  bool get _validateCreation {
    if (_nickController.text.isEmpty) {
      AppNotifications.showToastAlert(_translate('errors.emptyNick'));
      return false;
    }
    return true;
  }

  void _goToMap() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => MapScreen()));
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
                    const SizedBox(height: 32.0),
                    Row(
                      children: [
                        Text(_translate("nick")),
                        const SizedBox(width: 8.0),
                        Expanded(
                          child: HardEdgeTextField(
                            controller: _nickController,
                            onSubmitted: (_) => _createUser(),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 32.0),
                    Text(
                      _translate("chooseVehicle"),
                      style: TextStyle(
                          fontFamily: Fonts.pressStart, color: Colors.black),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 8.0),
                    VehiclePicker(
                      selected: _selectedVehicle,
                      onSelect: (selected) => setChoosedVehicle(selected),
                    ),
                    const SizedBox(height: 32.0),
                    HardEdgeButton(
                      text: _translate("create").toUpperCase(),
                      onPressed: _createUser,
                    ),
                  ],
                ),
        );
      }, // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
