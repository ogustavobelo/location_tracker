import 'package:equatable/equatable.dart';

import 'location_entity.dart';

class User extends Equatable {
  final String uid;
  final String name;
  final Location location;
  final Vehicle vehicle;
  final bool visible;
  User({
    required this.uid,
    required this.name,
    required this.location,
    required this.vehicle,
    required this.visible,
  });

  @override
  List<Object?> get props => [uid];
}

enum Vehicle { car, truck, bike, moto, unknown }
