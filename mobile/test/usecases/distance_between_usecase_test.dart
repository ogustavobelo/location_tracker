import 'package:flutter_test/flutter_test.dart';
import 'package:location_tracker/data/repositories/location_repository_impl.dart';
import 'package:location_tracker/domain/entities/distance_between_entity.dart'
    as entity;
import 'package:location_tracker/domain/repositories/location_repository.dart';
import 'package:location_tracker/domain/usecases/distance_between_usecase.dart';

void main() {
  late DistanceBetween useCase;

  setUp(() {
    final LocationRepository locationRepository = LocationRepositoryImpl();
    useCase = DistanceBetween(locationRepository: locationRepository);
  });

  test('When into DistanceBetween params should return a double', () {
    final value = entity.DistanceBetween(
      startLatitude: 0.0,
      startLongitude: 1.0,
      endLatitude: 2.0,
      endLongitude: 3.0,
    );
    expect(useCase(params: value), equals(314827.08993590315));
  });
}
