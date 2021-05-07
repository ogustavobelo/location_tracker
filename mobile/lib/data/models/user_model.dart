import 'package:json_annotation/json_annotation.dart';

import 'package:location_tracker/domain/entities/user_entity.dart';

import 'location_model.dart';

part 'user_model.g.dart';

@JsonSerializable(
  anyMap: true,
  explicitToJson: true,
  fieldRename: FieldRename.snake,
)
class UserModel extends User {
  final LocationModel? location;
  UserModel({
    @JsonKey(name: 'created_at') DateTime? createdAt,
    String? uid,
    required String nick,
    this.location,
    required String vehicle,
    required bool visible,
    @JsonKey(name: 'is_web') required bool isWeb,
  }) : super(
          createdAt: createdAt,
          uid: uid,
          nick: nick,
          location: location,
          vehicle: vehicle,
          visible: visible,
          isWeb: isWeb,
        );

  factory UserModel.fromJson(Map json) => _$UserModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
