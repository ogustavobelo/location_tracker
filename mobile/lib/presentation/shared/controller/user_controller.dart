import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:location_tracker/core/constants/vehicle_const.dart';
import 'package:location_tracker/core/error/exceptions.dart';
import 'package:location_tracker/domain/entities/location_entity.dart';
import 'package:location_tracker/domain/entities/user_entity.dart';
import 'package:location_tracker/domain/entities/websocket_payload_entity.dart';
import 'package:location_tracker/domain/usecases/create_user_usecase.dart';
import 'package:location_tracker/domain/usecases/list_users_usecase.dart';
import 'package:location_tracker/domain/usecases/on_location_changed_usecase.dart';
import 'package:location_tracker/domain/usecases/on_message_usecase.dart';
import 'package:mobx/mobx.dart';

import 'package:location_tracker/core/logger/logger.dart';

part 'user_controller.g.dart';
part 'user_controller.params.dart';

@singleton
class UserController = _UserControllerBase with _$UserController;

abstract class _UserControllerBase with Store {
  final Logger logger;
  final CreateUser createUserUseCase;
  final ListUsers listUsersUseCase;
  final OnMessageUseCase onMessageControllerUseCase;
  final OnLocationChangedUseCase onLocationChangedUseCase;
  _UserControllerBase({
    required this.logger,
    required this.createUserUseCase,
    required this.onMessageControllerUseCase,
    required this.listUsersUseCase,
    required this.onLocationChangedUseCase,
  });

  @observable
  User user = _anonymous;

  @action
  void setUser(User updatedUser) {
    user = updatedUser;
  }

  StreamController<WebSocketPayload> onMessage() {
    return onMessageControllerUseCase();
  }

  StreamController<Location> onLocationChanged() {
    return onLocationChangedUseCase();
  }

  Future<void> listUsers(Function(String) translate) async {
    final usecase = await listUsersUseCase();
    usecase.fold(
      (error) {
        logger.print('Error on createUser $error');
        throw UserException(translate('errors.unableList'));
      },
      (_) {
        print('User List updated!');
      },
    );
  }

  Future<void> createUser({
    required UserCreateParams params,
    required Function(String) translate,
  }) async {
    final User _newUser = User(
      visible: true,
      nick: params.name,
      vehicle: params.vehicle,
      location: params.location,
    );

    final useCase = await createUserUseCase(params: _newUser);
    useCase.fold(
      (error) {
        logger.print('Error on createUser $error');
        throw UserException(translate('errors.unableCreate'));
      },
      (_) {
        setUser(_newUser);
      },
    );
  }

  static User get _anonymous {
    return User(
      nick: 'Anonymous',
      vehicle: VehiclesConst.unknown,
      visible: true,
    );
  }
}
