// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'websocket_payload_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WebSocketPayloadModel _$WebSocketPayloadModelFromJson(Map json) {
  return WebSocketPayloadModel(
    action: json['action'] as String,
    connectedUsers: (json['connected_users'] as List<dynamic>)
        .map((e) => UserModel.fromJson(e as Map))
        .toList(),
  );
}

Map<String, dynamic> _$WebSocketPayloadModelToJson(
        WebSocketPayloadModel instance) =>
    <String, dynamic>{
      'action': instance.action,
      'connected_users':
          instance.connectedUsers.map((e) => e.toJson()).toList(),
    };
