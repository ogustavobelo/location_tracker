import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:location_tracker/core/error/failures.dart';
import 'package:location_tracker/core/success/success.dart';
import 'package:location_tracker/core/usecase/usecase.dart';
import 'package:location_tracker/domain/repositories/user_repository.dart';

@injectable
class ListUsers implements UseCaseFuture<Either<Failure, Success>, void> {
  final UserRepository userRepository;
  ListUsers({
    required this.userRepository,
  });
  @override
  Future<Either<Failure, Success>> call({void params}) {
    return userRepository.listUsers();
  }
}
