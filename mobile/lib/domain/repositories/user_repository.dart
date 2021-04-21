import 'package:dartz/dartz.dart';

import 'package:location_tracker/core/error/failures.dart';
import 'package:location_tracker/core/success/success.dart';
import 'package:location_tracker/domain/entities/user_entity.dart';
import 'package:location_tracker/domain/entities/websocket_payload_entity.dart';

abstract class UserRepository {
  Future<Either<Failure, Success>> createUser(User user);
  Stream<WebSocketPayload> onMessage();
}
