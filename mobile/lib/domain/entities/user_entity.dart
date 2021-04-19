import 'package:equatable/equatable.dart';
import 'package:location_tracker/domain/entities/vehicle_enum.dart';

import 'location_entity.dart';

class User extends Equatable {
  final String? uid;
  final String name;
  final Location? location;
  final Vehicle vehicle;
  final bool visible;
  User({
    this.uid,
    required this.name,
    this.location,
    required this.vehicle,
    required this.visible,
  });

  @override
  List<Object?> get props => [uid];
}
