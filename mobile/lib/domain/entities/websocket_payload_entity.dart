import 'dart:convert';

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

  Map<String, dynamic> toMap() {
    return {
      'action': action,
      'connected_users': connectedUsers,
    };
  }

  factory WebSocketPayload.fromMap(Map<String, dynamic> map) {
    return WebSocketPayload(
      action: map['action'],
      connectedUsers: List<String>.from(map['connected_users']),
    );
  }

  String toJson() => json.encode(toMap());

  factory WebSocketPayload.fromJson(String source) =>
      WebSocketPayload.fromMap(json.decode(source));
}
