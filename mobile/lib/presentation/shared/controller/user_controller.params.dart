part of 'user_controller.dart';

class UserCreateParams {
  final String name;
  final Vehicle vehicle;
  final Location location;
  UserCreateParams({
    required this.name,
    required this.vehicle,
    required this.location,
  });
}
