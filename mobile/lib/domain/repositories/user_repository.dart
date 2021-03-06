import 'dart:async';

import 'package:dartz/dartz.dart';

import 'package:location_tracker/core/error/failures.dart';
import 'package:location_tracker/core/success/success.dart';
import 'package:location_tracker/domain/entities/user_entity.dart';
import 'package:location_tracker/domain/entities/websocket_payload_entity.dart';

abstract class UserRepository {
  Future<Either<Failure, Success>> createUser(User user);
  Future<Either<Failure, Success>> updateUser(User user);
  Future<Either<Failure, Success>> deleteUser(User user);
  Future<Either<Failure, Success>> listUsers();
  StreamController<WebSocketPayload> onMessageController();

  Future<Either<Failure, Success>> hasConnectivity();
  StreamController<bool> hasConnectivityStream();
}
