part of 'user_controller.dart';

class UserCreateParams {
  final String name;
  final String vehicle;
  final Location location;
  UserCreateParams({
    required this.name,
    required this.vehicle,
    required this.location,
  });
}
