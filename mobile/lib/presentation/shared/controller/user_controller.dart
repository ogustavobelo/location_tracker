import 'package:injectable/injectable.dart';
import 'package:location_tracker/core/error/exceptions.dart';
import 'package:location_tracker/domain/entities/location_entity.dart';
import 'package:location_tracker/domain/entities/user_entity.dart';
import 'package:location_tracker/domain/entities/vehicle_enum.dart';
import 'package:location_tracker/domain/entities/websocket_payload_entity.dart';
import 'package:location_tracker/domain/usecases/create_user_usecase.dart';
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
  final OnMessageUseCase onMessageUseCase;
  _UserControllerBase(
      {required this.logger,
      required this.createUserUseCase,
      required this.onMessageUseCase});

  @observable
  User user = _anonymous;

  @action
  void setUser(User updatedUser) {
    user = updatedUser;
  }

  Stream<WebSocketPayload> onMessage() {
    return onMessageUseCase();
  }

  Future<void> createUser({
    required UserCreateParams params,
    required Function(String) translate,
  }) async {
    final User _newUser = User(
      uid: '123456',
      visible: true,
      name: params.name,
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
      name: 'Anonymous',
      vehicle: Vehicle.unknown,
      visible: true,
    );
  }
}
