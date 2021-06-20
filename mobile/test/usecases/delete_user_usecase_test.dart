import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:location_tracker/core/error/failures.dart';
import 'package:location_tracker/core/success/success.dart';
import 'package:location_tracker/domain/entities/user_entity.dart';
import 'package:location_tracker/domain/repositories/user_repository.dart';
import 'package:location_tracker/domain/usecases/delete_user_usecase.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'delete_user_usecase_test.mocks.dart';

@GenerateMocks([
  User,
  UserRepository,
])
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  final MockUser user = MockUser();
  final MockUserRepository userRepository = MockUserRepository();
  late DeleteUser deleteUser;

  setUp(() {
    deleteUser = DeleteUser(userRepository: userRepository);
  });

  test('Delete User should return a Success', () async {
    when(userRepository.deleteUser(user))
        .thenAnswer((_) async => right(VoidSuccess()));
    expect(
      await deleteUser(params: user),
      equals(Right(VoidSuccess())),
    );
  });

  test('Delete User should return a Failure when hasn\'t user', () async {
    when(userRepository.deleteUser(any))
        .thenAnswer((_) async => left(UserFailure()));
    expect(
      await deleteUser(params: user),
      equals(Left(UserFailure())),
    );
  });
}
