// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../data/repositories/location_repository_impl.dart' as _i4;
import '../../domain/repositories/location_repository.dart' as _i3;
import '../../domain/usecases/get_current_location_usecase.dart' as _i7;
import '../../domain/usecases/request_location_service_usecase.dart' as _i5;
import '../../domain/usecases/request_permission_usecase.dart' as _i6;
import '../../presentation/shared/controller/app_controller.dart'
    as _i8; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.factory<_i3.LocationRepository>(() => _i4.LocationRepositoryImpl());
  gh.factory<_i5.RequestLocationService>(() => _i5.RequestLocationService(
      locationRepository: get<_i3.LocationRepository>()));
  gh.factory<_i6.RequestPermission>(() =>
      _i6.RequestPermission(locationRepository: get<_i3.LocationRepository>()));
  gh.factory<_i7.GetCurrentLocation>(() => _i7.GetCurrentLocation(
      locationRepository: get<_i3.LocationRepository>()));
  gh.singleton<_i8.AppController>(_i8.AppController(
      getCurrentLocation: get<_i7.GetCurrentLocation>(),
      requestLocationService: get<_i5.RequestLocationService>(),
      requestPermission: get<_i6.RequestPermission>()));
  return get;
}
