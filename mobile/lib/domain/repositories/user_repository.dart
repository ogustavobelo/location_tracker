import 'package:dartz/dartz.dart';
import 'package:location_tracker/core/error/failures.dart';
import 'package:location_tracker/core/success/success.dart';
import 'package:location_tracker/domain/entities/user_entity.dart';

abstract class UserRepository {
  Future<Either<Failure, Success>> createUser(User user);
}
