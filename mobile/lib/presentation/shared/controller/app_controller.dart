import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:location_tracker/core/error/exceptions.dart';
import 'package:location_tracker/core/error/failures.dart';
import 'package:location_tracker/core/logger/logger.dart';
import 'package:location_tracker/core/success/success.dart';
import 'package:location_tracker/domain/entities/location_entity.dart';
import 'package:location_tracker/domain/usecases/get_current_location_usecase.dart';
import 'package:location_tracker/domain/usecases/request_location_service_usecase.dart';
import 'package:location_tracker/domain/usecases/request_permission_usecase.dart';
import 'package:mobx/mobx.dart';

part 'app_controller.g.dart';

@singleton
class AppController = _AppControllerBase with _$AppController;

abstract class _AppControllerBase with Store {
  final Logger logger;
  final GetCurrentLocation getCurrentLocation;
  final RequestLocationService requestLocationServiceUseCase;
  final RequestPermission requestPermissionUseCase;

  _AppControllerBase({
    required this.logger,
    required this.getCurrentLocation,
    required this.requestLocationServiceUseCase,
    required this.requestPermissionUseCase,
  });

  @observable
  Location? location;

  @observable
  bool hasPermission = false;

  @observable
  bool locationServiceEnabled = false;

  @observable
  bool loading = false;

  @observable
  String loadingMessage = "";

  @action
  void startLoading({String message = "Loading"}) {
    loading = true;
    loadingMessage = message;
  }

  @action
  void stopLoading() {
    loading = false;
    loadingMessage = "";
  }

  @action
  Future<Location?> getLocation() async {
    try {
      final usecase = await getCurrentLocation();
      return usecase.fold(
        (error) => throw error,
        (result) {
          location = result;
          return result;
        },
      );
    } catch (e) {
      logger.print("Error on setLocation $e", className: "AppController");
      throw LocationException("Unable to set current location");
    }
  }

  @action
  Future<void> requestPermission() async {
    try {
      final Either<Failure, Success> useCase = await requestPermissionUseCase();
      useCase.fold(
        (error) => throw error,
        (_) => hasPermission = true,
      );
    } catch (e) {
      logger.print("Error on Request Permission $e",
          className: "AppController");
      hasPermission = false;
      throw LocationException("Location Permission not allowed");
    }
  }

  @action
  Future<void> requestServiceLocation() async {
    try {
      final Either<Failure, Success> useCase =
          await requestLocationServiceUseCase();
      useCase.fold(
        (error) => throw error,
        (_) => locationServiceEnabled = true,
      );
    } catch (e) {
      logger.print("Error on requestServiceLocation $e",
          className: "AppController");
      locationServiceEnabled = false;
      throw LocationException("Location Permission not allowed");
    }
  }
}
