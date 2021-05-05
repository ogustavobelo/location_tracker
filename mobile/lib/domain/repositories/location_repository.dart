import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:location_tracker/core/error/failures.dart';
import 'package:location_tracker/core/success/success.dart';
import 'package:location_tracker/domain/entities/distance_between_entity.dart';
import 'package:location_tracker/domain/entities/location_entity.dart';

abstract class LocationRepository {
  Future<Either<Failure, Location>> getCurrentLocation();
  Future<Either<Failure, Success>> requestPermission();
  Future<Either<Failure, Success>> requestLocationService();
  StreamController<Location> onLocationChanged();
  double distanceBetween(DistanceBetween distanceParams);
}
