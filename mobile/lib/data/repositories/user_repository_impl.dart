import 'package:injectable/injectable.dart';
import 'package:location_tracker/domain/entities/user_entity.dart';
import 'package:location_tracker/core/success/success.dart';
import 'package:location_tracker/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:location_tracker/domain/repositories/user_repository.dart';

@Injectable(as: UserRepository)
class UserRepositoryImpl implements UserRepository {
  @override
  Future<Either<Failure, Success>> createUser(User user) async {
    try {
      return right(VoidSuccess());
    } catch (e) {
      return left(UserFailure());
    }
  }
}
