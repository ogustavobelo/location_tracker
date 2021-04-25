// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../data/datasource/websocket_datasource.dart' as _i9;
import '../../data/repositories/location_repository_impl.dart' as _i5;
import '../../data/repositories/user_repository_impl.dart' as _i12;
import '../../domain/repositories/location_repository.dart' as _i4;
import '../../domain/repositories/user_repository.dart' as _i11;
import '../../domain/usecases/create_user_usecase.dart' as _i13;
import '../../domain/usecases/get_current_location_usecase.dart' as _i10;
import '../../domain/usecases/list_users_usecase.dart' as _i14;
import '../../domain/usecases/on_message_usecase.dart' as _i15;
import '../../domain/usecases/request_location_service_usecase.dart' as _i7;
import '../../domain/usecases/request_permission_usecase.dart' as _i8;
import '../../presentation/shared/controller/app_controller.dart' as _i16;
import '../../presentation/shared/controller/user_controller.dart' as _i17;
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
  gh.factory<_i7.RequestLocationService>(() => _i7.RequestLocationService(
      locationRepository: get<_i4.LocationRepository>()));
  gh.factory<_i8.RequestPermission>(() =>
      _i8.RequestPermission(locationRepository: get<_i4.LocationRepository>()));
  gh.factory<_i9.WebSocketDS>(
      () => _i9.WebSocketDSImpl(flavors: get<_i3.Flavors>()));
  gh.factory<_i10.GetCurrentLocation>(() => _i10.GetCurrentLocation(
      locationRepository: get<_i4.LocationRepository>()));
  gh.factory<_i11.UserRepository>(
      () => _i12.UserRepositoryImpl(get<_i9.WebSocketDS>()));
  gh.factory<_i13.CreateUser>(
      () => _i13.CreateUser(userRepository: get<_i11.UserRepository>()));
  gh.factory<_i14.ListUsers>(
      () => _i14.ListUsers(userRepository: get<_i11.UserRepository>()));
  gh.factory<_i15.OnMessageControllerUseCase>(() =>
      _i15.OnMessageControllerUseCase(
          userRepository: get<_i11.UserRepository>()));
  gh.singleton<_i16.AppController>(_i16.AppController(
      logger: get<_i6.Logger>(),
      getCurrentLocation: get<_i10.GetCurrentLocation>(),
      requestLocationServiceUseCase: get<_i7.RequestLocationService>(),
      requestPermissionUseCase: get<_i8.RequestPermission>()));
  gh.singleton<_i17.UserController>(_i17.UserController(
      logger: get<_i6.Logger>(),
      createUserUseCase: get<_i13.CreateUser>(),
      onMessageControllerUseCase: get<_i15.OnMessageControllerUseCase>(),
      listUsersUseCase: get<_i14.ListUsers>()));
  return get;
}
