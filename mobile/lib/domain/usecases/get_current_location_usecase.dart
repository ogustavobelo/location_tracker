import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import 'package:location_tracker/core/error/failures.dart';
import 'package:location_tracker/core/usecase/usecase.dart';
import 'package:location_tracker/domain/entities/location_entity.dart';
import 'package:location_tracker/domain/repositories/location_repository.dart';

@injectable
class GetCurrentLocation
    extends UseCaseFuture<Either<Failure, Location>, void> {
  final LocationRepository locationRepository;
  GetCurrentLocation({
    required this.locationRepository,
  });
  @override
  Future<Either<Failure, Location>> call({void params}) {
    return locationRepository.getCurrentLocation();
  }
}
