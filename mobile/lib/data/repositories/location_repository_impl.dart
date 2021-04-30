import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:location/location.dart';
import 'package:location_tracker/core/error/failures.dart';
import 'package:location_tracker/core/success/success.dart';
import 'package:location_tracker/domain/entities/location_entity.dart'
    as entity;
import 'package:location_tracker/domain/repositories/location_repository.dart';

@Injectable(as: LocationRepository)
class LocationRepositoryImpl implements LocationRepository {
  final Location _locationInstance = Location();
  LocationRepositoryImpl() {
    _locationInstance.changeSettings(
      accuracy: LocationAccuracy.high,
    );
  }

  @override
  Future<Either<Failure, entity.Location>> getCurrentLocation() async {
    try {
      final LocationData currentLocation = await _locationInstance
          .getLocation()
          .timeout(Duration(seconds: 10),
              onTimeout: () => throw LocationFailure());
      return right(entity.Location(
          latitude: currentLocation.latitude!,
          longitude: currentLocation.longitude!,
          heading: currentLocation.heading!));
    } catch (e) {
      return left(LocationFailure());
    }
  }

  @override
  Future<Either<Failure, Success>> requestPermission() async {
    try {
      bool _validateDenied(PermissionStatus permission) {
        return permission == PermissionStatus.denied ||
            permission == PermissionStatus.deniedForever;
      }

      PermissionStatus _permissionGranted =
          await _locationInstance.hasPermission();
      if (_validateDenied(_permissionGranted)) {
        _permissionGranted = await _locationInstance.requestPermission();
        if (_validateDenied(_permissionGranted)) {
          return left(LocationFailure());
        }
      }
      return right(VoidSuccess());
    } catch (e) {
      return left(LocationFailure());
    }
  }

  @override
  Future<Either<Failure, Success>> requestLocationService() async {
    try {
      final location = Location();

      bool _serviceEnabled = await location.serviceEnabled();
      if (!_serviceEnabled) {
        _serviceEnabled = await location.requestService();
        if (!_serviceEnabled) {
          return left(LocationFailure());
        }
      }
      return right(VoidSuccess());
    } catch (e) {
      return left(LocationFailure());
    }
  }

  @override
  StreamController<entity.Location> onLocationChanged() {
    final StreamController<entity.Location> controller =
        StreamController<entity.Location>.broadcast();

    final Stream<entity.Location> stream =
        _locationInstance.onLocationChanged.map((locationData) {
      return entity.Location(
          latitude: locationData.latitude!,
          longitude: locationData.longitude!,
          heading: locationData.heading!);
    });
    controller.addStream(stream);
    return controller;
  }
}
