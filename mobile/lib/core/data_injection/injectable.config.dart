// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../data/datasource/websocket_datasource.dart' as _i10;
import '../../data/repositories/location_repository_impl.dart' as _i5;
import '../../data/repositories/user_repository_impl.dart' as _i14;
import '../../domain/repositories/location_repository.dart' as _i4;
import '../../domain/repositories/user_repository.dart' as _i13;
import '../../domain/usecases/create_user_usecase.dart' as _i15;
import '../../domain/usecases/delete_user_usecase.dart' as _i16;
import '../../domain/usecases/distance_between_usecase.dart' as _i11;
import '../../domain/usecases/get_current_location_usecase.dart' as _i12;
import '../../domain/usecases/has_connectivity_stream_usecase.dart' as _i19;
import '../../domain/usecases/has_connectivity_usecase.dart' as _i17;
import '../../domain/usecases/list_users_usecase.dart' as _i18;
import '../../domain/usecases/on_location_changed_usecase.dart' as _i7;
import '../../domain/usecases/on_message_usecase.dart' as _i20;
import '../../domain/usecases/request_location_service_usecase.dart' as _i8;
import '../../domain/usecases/request_permission_usecase.dart' as _i9;
import '../../domain/usecases/update_user_usecase.dart' as _i21;
import '../../presentation/shared/controller/app_controller.dart' as _i23;
import '../../presentation/shared/controller/user_controller.dart' as _i22;
import '../flavors/flavors.dart' as _i3;
import '../logger/logger.dart' as _i6; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.factory<_i3.Flavors>(() => _i3.FlavorsDev());
  gh.factory<_i4.LocationRepository>(() => _i5.LocationRepositoryImpl());
  gh.factory<_i6.Logger>(() => _i6.LocalLogger());
  gh.factory<_i7.OnLocationChangedUseCase>(() => _i7.OnLocationChangedUseCase(
      locationRepository: get<_i4.LocationRepository>()));
  gh.factory<_i8.RequestLocationService>(() => _i8.RequestLocationService(
      locationRepository: get<_i4.LocationRepository>()));
  gh.factory<_i9.RequestPermission>(() =>
      _i9.RequestPermission(locationRepository: get<_i4.LocationRepository>()));
  gh.factory<_i10.WebSocketDS>(
      () => _i10.WebSocketDSImpl(flavors: get<_i3.Flavors>()));
  gh.factory<_i11.DistanceBetween>(() =>
      _i11.DistanceBetween(locationRepository: get<_i4.LocationRepository>()));
  gh.factory<_i12.GetCurrentLocation>(() => _i12.GetCurrentLocation(
      locationRepository: get<_i4.LocationRepository>()));
  gh.factory<_i13.UserRepository>(
      () => _i14.UserRepositoryImpl(get<_i10.WebSocketDS>()));
  gh.factory<_i15.CreateUser>(
      () => _i15.CreateUser(userRepository: get<_i13.UserRepository>()));
  gh.factory<_i16.DeleteUser>(
      () => _i16.DeleteUser(userRepository: get<_i13.UserRepository>()));
  gh.factory<_i17.HasConnectivity>(
      () => _i17.HasConnectivity(get<_i13.UserRepository>()));
  gh.factory<_i18.ListUsers>(
      () => _i18.ListUsers(userRepository: get<_i13.UserRepository>()));
  gh.factory<_i19.OnConnectivityChangeUseCase>(() =>
      _i19.OnConnectivityChangeUseCase(
          userRepository: get<_i13.UserRepository>()));
  gh.factory<_i20.OnMessageUseCase>(
      () => _i20.OnMessageUseCase(userRepository: get<_i13.UserRepository>()));
  gh.factory<_i21.UpdateUser>(
      () => _i21.UpdateUser(userRepository: get<_i13.UserRepository>()));
  gh.singleton<_i22.UserController>(_i22.UserController(
      logger: get<_i6.Logger>(),
      createUserUseCase: get<_i15.CreateUser>(),
      updateUserUseCase: get<_i21.UpdateUser>(),
      deleteUserUseCase: get<_i16.DeleteUser>(),
      onMessageControllerUseCase: get<_i20.OnMessageUseCase>(),
      listUsersUseCase: get<_i18.ListUsers>(),
      onLocationChangedUseCase: get<_i7.OnLocationChangedUseCase>(),
      distanceBetweenUseCase: get<_i11.DistanceBetween>()));
  gh.singleton<_i23.AppController>(_i23.AppController(
      logger: get<_i6.Logger>(),
      getCurrentLocation: get<_i12.GetCurrentLocation>(),
      requestLocationServiceUseCase: get<_i8.RequestLocationService>(),
      requestPermissionUseCase: get<_i9.RequestPermission>(),
      onConnectivityChangeUseCase: get<_i19.OnConnectivityChangeUseCase>(),
      hasConnectivityUseCase: get<_i17.HasConnectivity>()));
  return get;
}
