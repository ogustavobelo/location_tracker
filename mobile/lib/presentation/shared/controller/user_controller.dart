import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:location_tracker/core/constants/vehicle_const.dart';
import 'package:location_tracker/core/error/exceptions.dart';
import 'package:location_tracker/core/helpers/strings_helpers.dart';
import 'package:location_tracker/domain/entities/distance_between_entity.dart';
import 'package:location_tracker/domain/entities/location_entity.dart';
import 'package:location_tracker/domain/entities/user_entity.dart';
import 'package:location_tracker/domain/entities/websocket_payload_entity.dart';
import 'package:location_tracker/domain/usecases/create_user_usecase.dart';
import 'package:location_tracker/domain/usecases/delete_user_usecase.dart';
import 'package:location_tracker/domain/usecases/distance_between_usecase.dart'
    as uc;
import 'package:location_tracker/domain/usecases/list_users_usecase.dart';
import 'package:location_tracker/domain/usecases/on_location_changed_usecase.dart';
import 'package:location_tracker/domain/usecases/on_message_usecase.dart';
import 'package:location_tracker/domain/usecases/update_user_usecase.dart';
import 'package:mobx/mobx.dart';

import 'package:location_tracker/core/logger/logger.dart';

part 'user_controller.g.dart';
part 'user_controller.params.dart';

@singleton
class UserController = _UserControllerBase with _$UserController;

abstract class _UserControllerBase with Store {
  final Logger logger;
  final CreateUser createUserUseCase;
  final UpdateUser updateUserUseCase;
  final DeleteUser deleteUserUseCase;
  final ListUsers listUsersUseCase;
  final OnMessageUseCase onMessageControllerUseCase;
  final OnLocationChangedUseCase onLocationChangedUseCase;
  final uc.DistanceBetween distanceBetweenUseCase;
  _UserControllerBase({
    required this.logger,
    required this.createUserUseCase,
    required this.updateUserUseCase,
    required this.deleteUserUseCase,
    required this.onMessageControllerUseCase,
    required this.listUsersUseCase,
    required this.onLocationChangedUseCase,
    required this.distanceBetweenUseCase,
  });

  @observable
  User user = _anonymous;

  @observable
  User? selectedUser;

  @observable
  Map<String, BitmapDescriptor> bitmaps = {};

  @action
  void setUser(User updatedUser) {
    user = updatedUser;
  }

  @action
  void setSelectedUser(User? user) {
    selectedUser = user;
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
      uid: StringHelper.uId(),
      visible: true,
      nick: params.name,
      vehicle: params.vehicle,
      location: params.location,
      createdAt: DateTime.now(),
      isWeb: kIsWeb,
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

  void updateMyUser(List<User> connectedUsers) {
    for (var conUser in connectedUsers) {
      if (user.uid == conUser.uid) {
        setUser(conUser);
        break;
      }
    }
  }

  Future<void> updateLocation(Location location) async {
    try {
      setUser(user.copyWith(location: location));
      final usecase = await updateUserUseCase(params: user);
      usecase.fold((l) => throw l, (r) => logger.print('location updated!'));
    } catch (e) {
      logger.print('Unable to update location $e');
    }
  }

  @action
  Future<void> getBitmapImage() async {
    final List<String> _vehicles = [
      VehiclesConst.car,
      VehiclesConst.policeCar,
      VehiclesConst.bus,
      VehiclesConst.truck,
      VehiclesConst.pin
    ];
    final vehiclesBitmaps = await Future.wait(_vehicles
        .map((vehicle) => BitmapDescriptor.fromAssetImage(
            ImageConfiguration.empty, 'assets/images/min/${vehicle}_min.png'))
        .toList());

    for (var i = 0; i < vehiclesBitmaps.length; i++) {
      bitmaps[_vehicles[i]] = vehiclesBitmaps[i];
    }
  }

  double lastPointDistance(double startLatitude, double startLongitude) {
    return distanceBetweenUseCase(
        params: DistanceBetween(
            startLatitude: startLatitude,
            startLongitude: startLongitude,
            endLatitude: user.location!.latitude,
            endLongitude: user.location!.longitude));
  }

  static User get _anonymous {
    return User(
      nick: 'Anonymous',
      vehicle: VehiclesConst.unknown,
      visible: true,
      isWeb: true,
    );
  }
}
