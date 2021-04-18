import 'package:flutter/material.dart';
import 'package:location_tracker/core/helpers/i18n_helper.dart';
import 'package:location_tracker/core/helpers/strings_helpers.dart';

import 'package:location_tracker/domain/entities/vehicle_enum.dart';

class VehicleButton extends StatelessWidget {
  final Vehicle vehicle;
  final Function(Vehicle) onSelect;
  final bool? selected;
  const VehicleButton({
    Key? key,
    required this.vehicle,
    required this.onSelect,
    this.selected = false,
  }) : super(key: key);
  final double _size = 150.0;

  String _translate(BuildContext context, String key) {
    return I18nHelper.translate(context, "vehicles.$key");
  }

  @override
  Widget build(BuildContext context) {
    final String _vehicle = StringHelper.enumToString(vehicle);
    return GestureDetector(
      onTap: () => onSelect(vehicle),
      child: AnimatedContainer(
        width: _size,
        height: _size,
        padding: const EdgeInsets.all(8.0),
        duration: const Duration(milliseconds: 250),
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          color: selected!
              ? Theme.of(context).primaryColor.withOpacity(.25)
              : Colors.transparent,
          border: Border.all(
            color: selected!
                ? Theme.of(context).primaryColorDark
                : Colors.transparent,
            width: 4,
          ),
        ),
        child: Column(
          children: [
            Flexible(
              child: Image.asset(
                "assets/images/$_vehicle.png",
                fit: BoxFit.contain,
              ),
            ),
            Text(
              _translate(context, "$_vehicle"),
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
