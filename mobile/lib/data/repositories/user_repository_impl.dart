import 'dart:async';
import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:location_tracker/data/datasource/websocket_datasource.dart';
import 'package:location_tracker/data/models/websocket_payload_model.dart';
import 'package:location_tracker/domain/entities/user_entity.dart';
import 'package:location_tracker/core/success/success.dart';
import 'package:location_tracker/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:location_tracker/domain/entities/websocket_payload_entity.dart';
import 'package:location_tracker/domain/repositories/user_repository.dart';

@Injectable(as: UserRepository)
class UserRepositoryImpl implements UserRepository {
  final WebSocketDS webSocketDS;
  UserRepositoryImpl(this.webSocketDS);
  @override
  Future<Either<Failure, Success>> createUser(User user) async {
    try {
      final data = {
        'action': 'create_user',
        'username': user.name,
      };
      webSocketDS.channel.sink.add(json.encode(data));
      return right(VoidSuccess());
    } catch (e) {
      return left(UserFailure());
    }
  }

  @override
  Stream<WebSocketPayload> onMessage() {
    return webSocketDS.channel.stream.map<WebSocketPayload>((event) {
      return WebSocketPayloadModel.fromJson(event);
    });
  }
}
