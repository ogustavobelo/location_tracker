import 'package:injectable/injectable.dart';

import 'package:location_tracker/core/usecase/usecase.dart';
import 'package:location_tracker/domain/entities/distance_between_entity.dart'
    as entity;
import 'package:location_tracker/domain/repositories/location_repository.dart';

@injectable
class DistanceBetween extends UseCase<double, entity.DistanceBetween> {
  DistanceBetween({
    required this.locationRepository,
  });
  final LocationRepository locationRepository;

  @override
  double call({entity.DistanceBetween? params}) {
    return locationRepository.distanceBetween(params!);
  }
}
