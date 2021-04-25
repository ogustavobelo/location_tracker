import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:location_tracker/core/error/failures.dart';
import 'package:location_tracker/core/success/success.dart';
import 'package:location_tracker/core/usecase/usecase.dart';
import 'package:location_tracker/domain/repositories/location_repository.dart';

@injectable
class RequestPermission extends UseCaseFuture<Either<Failure, Success>, void> {
  final LocationRepository locationRepository;
  RequestPermission({
    required this.locationRepository,
  });
  @override
  Future<Either<Failure, Success>> call({void params}) {
    return locationRepository.requestPermission();
  }
}
