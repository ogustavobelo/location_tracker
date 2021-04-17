import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:location_tracker/core/data_injection/injectable.dart';
import 'package:location_tracker/domain/entities/vehicle_enum.dart';
import 'package:location_tracker/presentation/home/components/vehicle_button_component.dart';
import 'package:location_tracker/presentation/shared/controller/user_controller.dart';

class VehiclePicker extends StatelessWidget {
  final _userController = getIt<UserController>();
  final List<Vehicle> _vehicles = [
    Vehicle.car,
    Vehicle.bike,
    Vehicle.moto,
    Vehicle.truck
  ];
  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return Center(
        child: Wrap(
            runSpacing: 8.0,
            spacing: 8.0,
            crossAxisAlignment: WrapCrossAlignment.center,
            runAlignment: WrapAlignment.center,
            children: _vehicles
                .map(
                  (vehicle) => VehicleButton(
                    vehicle: vehicle,
                    selected: _userController.selectedVehicle == vehicle,
                    onSelect: (selected) =>
                        _userController.setSelectedVehicle(selected),
                  ),
                )
                .toList()),
      );
    });
  }
}
