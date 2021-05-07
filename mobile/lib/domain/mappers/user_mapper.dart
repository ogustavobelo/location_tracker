import 'package:location_tracker/data/models/user_model.dart';
import 'package:location_tracker/domain/entities/user_entity.dart';
import 'package:location_tracker/domain/mappers/location_mapper.dart';

class UserMapper {
  static UserModel entityToModel(User entity) => UserModel(
        nick: entity.nick,
        uid: entity.uid,
        location: LocationMapper.entityToModel(entity.location!),
        visible: entity.visible,
        vehicle: entity.vehicle,
        createdAt: entity.createdAt,
        isWeb: entity.isWeb,
      );

  static User modelToEntity(UserModel model) => User(
        nick: model.nick,
        uid: model.uid,
        location: LocationMapper.modelToEntity(model.location!),
        visible: model.visible,
        vehicle: model.vehicle,
        createdAt: model.createdAt,
        isWeb: model.isWeb,
      );
}
