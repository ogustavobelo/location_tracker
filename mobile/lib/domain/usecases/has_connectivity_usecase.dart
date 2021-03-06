import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:location_tracker/core/error/failures.dart';
import 'package:location_tracker/core/success/success.dart';
import 'package:location_tracker/core/usecase/usecase.dart';
import 'package:location_tracker/domain/repositories/user_repository.dart';

@injectable
class HasConnectivity extends UseCaseFuture<Either<Failure, Success>, void> {
  HasConnectivity(this.userRepository);
  final UserRepository userRepository;

  @override
  Future<Either<Failure, Success>> call({void params}) {
    return userRepository.hasConnectivity();
  }
}
