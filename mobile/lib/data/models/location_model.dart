import 'package:location_tracker/domain/entities/location_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'location_model.g.dart';

@JsonSerializable(
  anyMap: true,
  explicitToJson: true,
)
class LocationModel extends Location {
  LocationModel({required double latitude, required double longitude})
      : super(latitude: latitude, longitude: longitude);

  factory LocationModel.fromJson(Map json) => _$LocationModelFromJson(json);
  Map<String, dynamic> toJson() => _$LocationModelToJson(this);
}
