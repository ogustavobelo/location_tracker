// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'websocket_payload_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WebSocketPayloadModel _$WebSocketPayloadModelFromJson(Map json) {
  return WebSocketPayloadModel(
    json['action'] as String,
    (json['connectedUsers'] as List<dynamic>).map((e) => e as String).toList(),
  );
}

Map<String, dynamic> _$WebSocketPayloadModelToJson(
        WebSocketPayloadModel instance) =>
    <String, dynamic>{
      'action': instance.action,
      'connectedUsers': instance.connectedUsers,
    };
