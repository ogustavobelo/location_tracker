import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:location_tracker/core/usecase/usecase.dart';
import 'package:location_tracker/domain/entities/location_entity.dart';
import 'package:location_tracker/domain/repositories/location_repository.dart';

@injectable
class OnLocationChangedUseCase
    implements UseCase<StreamController<Location>, void> {
  final LocationRepository locationRepository;
  OnLocationChangedUseCase({
    required this.locationRepository,
  });
  @override
  StreamController<Location> call({Object? params}) {
    return locationRepository.onLocationChanged();
  }
}
