// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../data/datasource/websocket_datasource.dart' as _i11;
import '../../data/repositories/location_repository_impl.dart' as _i6;
import '../../data/repositories/user_repository_impl.dart' as _i15;
import '../../domain/repositories/location_repository.dart' as _i5;
import '../../domain/repositories/user_repository.dart' as _i14;
import '../../domain/usecases/create_user_usecase.dart' as _i16;
import '../../domain/usecases/delete_user_usecase.dart' as _i17;
import '../../domain/usecases/distance_between_usecase.dart' as _i12;
import '../../domain/usecases/generate_uid_usecase.dart' as _i4;
import '../../domain/usecases/get_current_location_usecase.dart' as _i13;
import '../../domain/usecases/has_connectivity_stream_usecase.dart' as _i20;
import '../../domain/usecases/has_connectivity_usecase.dart' as _i18;
import '../../domain/usecases/list_users_usecase.dart' as _i19;
import '../../domain/usecases/on_location_changed_usecase.dart' as _i8;
import '../../domain/usecases/on_message_usecase.dart' as _i21;
import '../../domain/usecases/request_location_service_usecase.dart' as _i9;
import '../../domain/usecases/request_permission_usecase.dart' as _i10;
import '../../domain/usecases/update_user_usecase.dart' as _i22;
import '../../presentation/shared/controller/app_controller.dart' as _i24;
import '../../presentation/shared/controller/user_controller.dart' as _i23;
import '../flavors/flavors.dart' as _i3;
import '../logger/logger.dart' as _i7; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.factory<_i3.Flavors>(() => _i3.FlavorsDev());
  gh.factory<_i4.GenerateUID>(() => _i4.GenerateUID());
  gh.factory<_i5.LocationRepository>(() => _i6.LocationRepositoryImpl());
  gh.factory<_i7.Logger>(() => _i7.LocalLogger());
  gh.factory<_i8.OnLocationChangedUseCase>(() => _i8.OnLocationChangedUseCase(
      locationRepository: get<_i5.LocationRepository>()));
  gh.factory<_i9.RequestLocationService>(() => _i9.RequestLocationService(
      locationRepository: get<_i5.LocationRepository>()));
  gh.factory<_i10.RequestPermission>(() => _i10.RequestPermission(
      locationRepository: get<_i5.LocationRepository>()));
  gh.factory<_i11.WebSocketDS>(
      () => _i11.WebSocketDSImpl(flavors: get<_i3.Flavors>()));
  gh.factory<_i12.DistanceBetween>(() =>
      _i12.DistanceBetween(locationRepository: get<_i5.LocationRepository>()));
  gh.factory<_i13.GetCurrentLocation>(() => _i13.GetCurrentLocation(
      locationRepository: get<_i5.LocationRepository>()));
  gh.factory<_i14.UserRepository>(
      () => _i15.UserRepositoryImpl(get<_i11.WebSocketDS>()));
  gh.factory<_i16.CreateUser>(
      () => _i16.CreateUser(userRepository: get<_i14.UserRepository>()));
  gh.factory<_i17.DeleteUser>(
      () => _i17.DeleteUser(userRepository: get<_i14.UserRepository>()));
  gh.factory<_i18.HasConnectivity>(
      () => _i18.HasConnectivity(get<_i14.UserRepository>()));
  gh.factory<_i19.ListUsers>(
      () => _i19.ListUsers(userRepository: get<_i14.UserRepository>()));
  gh.factory<_i20.OnConnectivityChangeUseCase>(() =>
      _i20.OnConnectivityChangeUseCase(
          userRepository: get<_i14.UserRepository>()));
  gh.factory<_i21.OnMessageUseCase>(
      () => _i21.OnMessageUseCase(userRepository: get<_i14.UserRepository>()));
  gh.factory<_i22.UpdateUser>(
      () => _i22.UpdateUser(userRepository: get<_i14.UserRepository>()));
  gh.singleton<_i23.UserController>(_i23.UserController(
      logger: get<_i7.Logger>(),
      createUserUseCase: get<_i16.CreateUser>(),
      updateUserUseCase: get<_i22.UpdateUser>(),
      deleteUserUseCase: get<_i17.DeleteUser>(),
      onMessageControllerUseCase: get<_i21.OnMessageUseCase>(),
      listUsersUseCase: get<_i19.ListUsers>(),
      onLocationChangedUseCase: get<_i8.OnLocationChangedUseCase>(),
      distanceBetweenUseCase: get<_i12.DistanceBetween>(),
      generateUIDUseCase: get<_i4.GenerateUID>()));
  gh.singleton<_i24.AppController>(_i24.AppController(
      logger: get<_i7.Logger>(),
      getCurrentLocation: get<_i13.GetCurrentLocation>(),
      requestLocationServiceUseCase: get<_i9.RequestLocationService>(),
      requestPermissionUseCase: get<_i10.RequestPermission>(),
      onConnectivityChangeUseCase: get<_i20.OnConnectivityChangeUseCase>(),
      hasConnectivityUseCase: get<_i18.HasConnectivity>()));
  return get;
}
