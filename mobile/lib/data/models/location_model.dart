import 'package:location_tracker/domain/entities/location_entity.dart';

class LocationModel extends Location {
  LocationModel({required double latitude, required double longitude})
      : super(latitude: latitude, longitude: longitude);

  factory LocationModel.byEntity(Location entity) {
    return LocationModel(
        latitude: entity.latitude, longitude: entity.longitude);
  }
}
