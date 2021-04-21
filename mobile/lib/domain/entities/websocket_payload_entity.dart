import 'package:equatable/equatable.dart';

class WebSocketPayload extends Equatable {
  final String action;
  final List<String> connectedUsers;
  WebSocketPayload({
    required this.action,
    required this.connectedUsers,
  });

  @override
  List<Object?> get props => [action];
}
