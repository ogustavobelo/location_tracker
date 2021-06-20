import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:location_tracker/core/error/exceptions.dart';
import 'package:location_tracker/core/error/failures.dart';
import 'package:location_tracker/core/logger/logger.dart';
import 'package:location_tracker/core/success/success.dart';

import 'package:location_tracker/domain/usecases/create_user_usecase.dart';
import 'package:location_tracker/domain/usecases/delete_user_usecase.dart';
import 'package:location_tracker/domain/usecases/distance_between_usecase.dart';
import 'package:location_tracker/domain/usecases/generate_uid_usecase.dart';
import 'package:location_tracker/domain/usecases/list_users_usecase.dart';
import 'package:location_tracker/domain/usecases/on_location_changed_usecase.dart';
import 'package:location_tracker/domain/usecases/on_message_usecase.dart';
import 'package:location_tracker/domain/usecases/update_user_usecase.dart';
import 'package:location_tracker/presentation/shared/controller/user_controller.dart';

import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../fixtures/user_fixture.dart';
import './user_controller_test.mocks.dart';

@GenerateMocks([
  CreateUser,
  DeleteUser,
  ListUsers,
  UpdateUser,
  DistanceBetween,
  OnLocationChangedUseCase,
  OnMessageUseCase,
  GenerateUID,
  Logger,
])
void main() {
  final MockCreateUser createUser = MockCreateUser();
  final MockDeleteUser deleteUser = MockDeleteUser();
  final MockListUsers listUsers = MockListUsers();
  final MockUpdateUser updateUser = MockUpdateUser();
  final MockDistanceBetween distanceBetween = MockDistanceBetween();
  final MockOnMessageUseCase onMessage = MockOnMessageUseCase();
  final MockOnLocationChangedUseCase onLocationChanged =
      MockOnLocationChangedUseCase();
  final MockGenerateUID generateUID = MockGenerateUID();
  final UserFixture userFixture = UserFixture();
  final String Function(String) _translate = (key) => '';

  late UserController userController;

  setUp(() {
    userController = UserController(
      logger: MockLogger(),
      createUserUseCase: createUser,
      deleteUserUseCase: deleteUser,
      distanceBetweenUseCase: distanceBetween,
      listUsersUseCase: listUsers,
      onLocationChangedUseCase: onLocationChanged,
      updateUserUseCase: updateUser,
      onMessageControllerUseCase: onMessage,
      generateUIDUseCase: generateUID,
    );
  });

  test('When create user should set current User', () async {
    final params = UserCreateParams(
      name: userFixture.entity.nick,
      vehicle: userFixture.entity.vehicle,
      location: userFixture.entity.location!,
    );
    when(createUser(params: userFixture.entity))
        .thenAnswer((_) async => right(VoidSuccess()));
    when(generateUID()).thenReturn(userFixture.entity.uid!);

    await userController.createUser(params: params, translate: _translate);

    expect(userController.user, userFixture.entity);
  });

  test('When list users fail, should return an UserException ', () async {
    when(listUsers()).thenAnswer((_) async => left(UserFailure()));

    expect(() async => await userController.listUsers(_translate),
        throwsA(isA<UserException>()));
  });
}
