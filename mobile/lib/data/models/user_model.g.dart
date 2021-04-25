// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map json) {
  return UserModel(
    createdAt: json['created_at'] == null
        ? null
        : DateTime.parse(json['created_at'] as String),
    uid: json['uid'] as String?,
    nick: json['nick'] as String,
    location: json['location'] == null
        ? null
        : LocationModel.fromJson(json['location'] as Map),
    vehicle: json['vehicle'] as String,
    visible: json['visible'] as bool,
  );
}

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'created_at': instance.createdAt?.toIso8601String(),
      'uid': instance.uid,
      'nick': instance.nick,
      'vehicle': instance.vehicle,
      'visible': instance.visible,
      'location': instance.location?.toJson(),
    };
