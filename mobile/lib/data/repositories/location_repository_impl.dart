import 'package:dartz/dartz.dart';
import 'package:location/location.dart' as location;
import 'package:location_tracker/core/error/failures.dart';
import 'package:location_tracker/domain/entities/location_entity.dart';
import 'package:location_tracker/domain/repositories/location_repository.dart';

class LocationRepositoryImpl implements LocationRepository {
  @override
  Future<Either<Failure, Location>> getCurrentLocation() async {
    try {
      final location.LocationData currentLocation =
          await location.Location().getLocation();
      return right(Location(
        latitude: currentLocation.latitude!,
        longitude: currentLocation.longitude!,
      ));
    } catch (e) {
      return left(LocationFailure());
    }
  }
}
