import 'package:equatable/equatable.dart';

import 'location_entity.dart';

class User extends Equatable {
  final DateTime? createdAt;
  final String? uid;
  final String nick;
  final Location? location;
  final String vehicle;
  final bool visible;
  User({
    this.createdAt,
    this.uid,
    required this.nick,
    this.location,
    required this.vehicle,
    required this.visible,
  });

  @override
  List<Object?> get props => [uid];
}
