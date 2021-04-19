// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../data/repositories/location_repository_impl.dart' as _i4;
import '../../data/repositories/user_repository_impl.dart' as _i9;
import '../../domain/repositories/location_repository.dart' as _i3;
import '../../domain/repositories/user_repository.dart' as _i8;
import '../../domain/usecases/create_user_usecase.dart' as _i10;
import '../../domain/usecases/get_current_location_usecase.dart' as _i11;
import '../../domain/usecases/request_location_service_usecase.dart' as _i6;
import '../../domain/usecases/request_permission_usecase.dart' as _i7;
import '../../presentation/shared/controller/app_controller.dart' as _i13;
import '../../presentation/shared/controller/user_controller.dart' as _i12;
import '../logger/logger.dart' as _i5; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.factory<_i3.LocationRepository>(() => _i4.LocationRepositoryImpl());
  gh.factory<_i5.Logger>(() => _i5.LocalLogger());
  gh.factory<_i6.RequestLocationService>(() => _i6.RequestLocationService(
      locationRepository: get<_i3.LocationRepository>()));
  gh.factory<_i7.RequestPermission>(() =>
      _i7.RequestPermission(locationRepository: get<_i3.LocationRepository>()));
  gh.factory<_i8.UserRepository>(() => _i9.UserRepositoryImpl());
  gh.factory<_i10.CreateUser>(
      () => _i10.CreateUser(userRepository: get<_i8.UserRepository>()));
  gh.factory<_i11.GetCurrentLocation>(() => _i11.GetCurrentLocation(
      locationRepository: get<_i3.LocationRepository>()));
  gh.singleton<_i12.UserController>(_i12.UserController(
      logger: get<_i5.Logger>(), createUserUseCase: get<_i10.CreateUser>()));
  gh.singleton<_i13.AppController>(_i13.AppController(
      logger: get<_i5.Logger>(),
      getCurrentLocation: get<_i11.GetCurrentLocation>(),
      requestLocationServiceUseCase: get<_i6.RequestLocationService>(),
      requestPermissionUseCase: get<_i7.RequestPermission>()));
  return get;
}
