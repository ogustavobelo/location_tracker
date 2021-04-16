import 'package:injectable/injectable.dart';
import 'package:location_tracker/data/models/location_model.dart';
import 'package:location_tracker/domain/usecases/get_current_location_usecase.dart';
import 'package:location_tracker/domain/usecases/request_location_service_usecase.dart';
import 'package:location_tracker/domain/usecases/request_permission_usecase.dart';
import 'package:mobx/mobx.dart';

part 'app_controller.g.dart';

@singleton
class AppController = _AppControllerBase with _$AppController;

abstract class _AppControllerBase with Store {
  final GetCurrentLocation getCurrentLocation;
  final RequestLocationService requestLocationService;
  final RequestPermission requestPermission;

  _AppControllerBase({
    required this.getCurrentLocation,
    required this.requestLocationService,
    required this.requestPermission,
  });

  @observable
  LocationModel? location;

  @action
  Future<void> setLocation() async {
    final usecase = await getCurrentLocation();
    usecase.fold((error) => throw error, (result) {
      location = LocationModel.byEntity(result);
    });
  }
}
