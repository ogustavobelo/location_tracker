import 'dart:async';
import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:location_tracker/core/constants/websockets_events.dart';
import 'package:location_tracker/data/datasource/websocket_datasource.dart';
import 'package:location_tracker/data/models/user_model.dart';
import 'package:location_tracker/data/models/websocket_payload_model.dart';
import 'package:location_tracker/domain/entities/user_entity.dart';
import 'package:location_tracker/core/success/success.dart';
import 'package:location_tracker/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:location_tracker/domain/entities/websocket_payload_entity.dart';
import 'package:location_tracker/domain/mappers/user_mapper.dart';
import 'package:location_tracker/domain/repositories/user_repository.dart';

@Injectable(as: UserRepository)
class UserRepositoryImpl implements UserRepository {
  final WebSocketDS webSocketDS;
  UserRepositoryImpl(this.webSocketDS);
  @override
  Future<Either<Failure, Success>> createUser(User user) async {
    try {
      final data = {
        'action': WSEvents.createUser,
        'user': UserMapper.entityToModel(user).toJson()
      };
      webSocketDS.channel.sink.add(json.encode(data));
      return right(VoidSuccess());
    } catch (e) {
      return left(UserFailure());
    }
  }

  @override
  Future<Either<Failure, Success>> updateUser(User user) async {
    try {
      final data = {
        'action': WSEvents.updateUser,
        'user': UserMapper.entityToModel(user).toJson()
      };
      webSocketDS.channel.sink.add(json.encode(data));
      return right(VoidSuccess());
    } catch (e) {
      return left(UserFailure());
    }
  }

  @override
  Future<Either<Failure, Success>> listUsers() async {
    try {
      final data = {'action': WSEvents.getUsers};
      webSocketDS.channel.sink.add(json.encode(data));
      return right(VoidSuccess());
    } catch (e) {
      return left(UserFailure());
    }
  }

  @override
  StreamController<WebSocketPayload> onMessageController() {
    final StreamController<WebSocketPayload> controller =
        StreamController<WebSocketPayload>.broadcast();
    final Stream<WebSocketPayload> stream =
        webSocketDS.channel.stream.map<WebSocketPayload>((event) {
      print(event);
      return WebSocketPayloadModel.fromJson(json.decode(event));
    });
    controller.addStream(stream);
    return controller;
  }
}
