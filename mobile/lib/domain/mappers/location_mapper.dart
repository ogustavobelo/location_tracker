import 'package:location_tracker/data/models/location_model.dart';
import 'package:location_tracker/domain/entities/location_entity.dart';

class LocationMapper {
  static LocationModel entityToModel(Location entity) {
    return LocationModel(
        latitude: entity.latitude, longitude: entity.longitude);
  }

  static Location modelToEntity(LocationModel model) {
    return Location(latitude: model.latitude, longitude: model.longitude);
  }
}
