import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:location_tracker/core/error/failures.dart';
import 'package:location_tracker/core/success/success.dart';
import 'package:location_tracker/core/usecase/usecase.dart';
import 'package:location_tracker/domain/entities/user_entity.dart';
import 'package:location_tracker/domain/repositories/user_repository.dart';

@injectable
class DeleteUser extends UseCaseFuture<Either<Failure, Success>, User> {
  final UserRepository userRepository;
  DeleteUser({
    required this.userRepository,
  });
  @override
  Future<Either<Failure, Success>> call({required User params}) async {
    return userRepository.deleteUser(params);
  }
}
