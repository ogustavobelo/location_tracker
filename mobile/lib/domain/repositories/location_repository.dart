import 'package:dartz/dartz.dart';
import 'package:location_tracker/core/error/failures.dart';
import 'package:location_tracker/domain/entities/location_entity.dart';

abstract class LocationRepository {
  Future<Either<Failure, Location>> getCurrentLocation();
}
