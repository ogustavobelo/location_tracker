import 'package:equatable/equatable.dart';

class DistanceBetween extends Equatable {
  DistanceBetween({
    required this.startLatitude,
    required this.startLongitude,
    required this.endLatitude,
    required this.endLongitude,
  });
  final double startLatitude;
  final double startLongitude;
  final double endLatitude;
  final double endLongitude;

  @override
  List<Object?> get props => [];
}
