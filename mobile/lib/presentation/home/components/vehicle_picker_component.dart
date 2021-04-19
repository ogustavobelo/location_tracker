import 'package:flutter/material.dart';
import 'package:location_tracker/domain/entities/vehicle_enum.dart';
import 'package:location_tracker/presentation/home/components/vehicle_button_component.dart';

class VehiclePicker extends StatelessWidget {
  final Vehicle selected;
  final Function(Vehicle) onSelect;
  const VehiclePicker({
    Key? key,
    required this.selected,
    required this.onSelect,
  }) : super(key: key);
  // final _userController = getIt<UserController>();
  static const List<Vehicle> _vehicles = [
    Vehicle.car,
    Vehicle.police_car,
    Vehicle.bus,
    Vehicle.truck
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
