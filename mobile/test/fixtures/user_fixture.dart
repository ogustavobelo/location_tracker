import 'package:location_tracker/domain/entities/location_entity.dart';
import 'package:location_tracker/domain/entities/user_entity.dart';

class UserFixture {
  final User entity = User(
    nick: 'Nick Test',
    isWeb: false,
    vehicle: 'unkwown',
    visible: false,
    uid: 'test123',
    location: LocationFixture.locationEntity,
  );
}

class LocationFixture {
  static Location locationEntity = Location(
    heading: 0.0,
    latitude: 0.0,
    longitude: 0.0,
  );
}
