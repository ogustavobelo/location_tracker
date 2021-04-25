import 'package:equatable/equatable.dart';
import 'package:location_tracker/domain/entities/user_entity.dart';

class WebSocketPayload extends Equatable {
  final String action;
  final List<User> connectedUsers;
  WebSocketPayload({
    required this.action,
    required this.connectedUsers,
  });

  @override
  List<Object?> get props => [action];
}
