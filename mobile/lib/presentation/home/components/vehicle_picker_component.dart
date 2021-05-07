import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:location_tracker/core/constants/vehicle_const.dart';
import 'package:location_tracker/presentation/home/components/vehicle_button_component.dart';

class VehiclePicker extends StatelessWidget {
  final String selected;
  final Function(String) onSelect;
  const VehiclePicker({
    Key? key,
    required this.selected,
    required this.onSelect,
  }) : super(key: key);
  // final _userController = getIt<UserController>();
  static const List<String> _vehicles = [
    VehiclesConst.car,
    VehiclesConst.policeCar,
    VehiclesConst.bus,
    VehiclesConst.truck,
    if (kIsWeb) VehiclesConst.pin
  ];
  @override
  Widget build(BuildContext context) {
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
                  selected: selected == vehicle,
                  onSelect: onSelect,
                ),
              )
              .toList()),
    );
  }
}
