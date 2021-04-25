import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:location_tracker/core/usecase/usecase.dart';
import 'package:location_tracker/domain/entities/websocket_payload_entity.dart';
import 'package:location_tracker/domain/repositories/user_repository.dart';

@injectable
class OnMessageControllerUseCase
    implements UseCase<StreamController<WebSocketPayload>, void> {
  final UserRepository userRepository;
  OnMessageControllerUseCase({
    required this.userRepository,
  });
  @override
  StreamController<WebSocketPayload> call({void params}) {
    return userRepository.onMessageController();
  }
}
