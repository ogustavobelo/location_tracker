import 'package:injectable/injectable.dart';
import 'package:location_tracker/domain/entities/user_entity.dart';
import 'package:location_tracker/domain/entities/vehicle_enum.dart';
import 'package:mobx/mobx.dart';

import 'package:location_tracker/core/logger/logger.dart';

part 'user_controller.g.dart';

@singleton
class UserController = _UserControllerBase with _$UserController;

abstract class _UserControllerBase with Store {
  final Logger logger;
  _UserControllerBase({
    required this.logger,
  });

  @observable
  Vehicle selectedVehicle = Vehicle.car;

  @action
  void setSelectedVehicle(Vehicle vehicle) {
    selectedVehicle = vehicle;
  }
}
