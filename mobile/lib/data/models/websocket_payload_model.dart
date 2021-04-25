import 'package:location_tracker/data/models/user_model.dart';
import 'package:location_tracker/domain/entities/websocket_payload_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'websocket_payload_model.g.dart';

@JsonSerializable(
  anyMap: true,
  explicitToJson: true,
)
class WebSocketPayloadModel extends WebSocketPayload {
  @JsonKey(name: 'connected_users')
  final List<UserModel> connectedUsers;
  WebSocketPayloadModel({required String action, required this.connectedUsers})
      : super(action: action, connectedUsers: connectedUsers);

  factory WebSocketPayloadModel.fromJson(Map json) =>
      _$WebSocketPayloadModelFromJson(json);

  Map<String, dynamic> toJson() => _$WebSocketPayloadModelToJson(this);
}
