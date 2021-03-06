import 'package:equatable/equatable.dart';

import 'location_entity.dart';

class User extends Equatable {
  final DateTime? createdAt;
  final String? uid;
  final String nick;
  final Location? location;
  final String vehicle;
  final bool visible;
  final bool isWeb;
  User({
    this.createdAt,
    this.uid,
    required this.nick,
    this.location,
    required this.vehicle,
    required this.visible,
    required this.isWeb,
  });

  @override
  List<Object?> get props => [uid];

  User copyWith({
    DateTime? createdAt,
    String? uid,
    String? nick,
    Location? location,
    String? vehicle,
    bool? visible,
    bool? isWeb,
  }) {
    return User(
      createdAt: createdAt ?? this.createdAt,
      uid: uid ?? this.uid,
      nick: nick ?? this.nick,
      location: location ?? this.location,
      vehicle: vehicle ?? this.vehicle,
      visible: visible ?? this.visible,
      isWeb: isWeb ?? this.isWeb,
    );
  }
}
