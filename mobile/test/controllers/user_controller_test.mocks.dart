// Mocks generated by Mockito 5.0.10 from annotations
// in location_tracker/test/controllers/user_controller_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i5;

import 'package:dartz/dartz.dart' as _i3;
import 'package:location_tracker/core/error/failures.dart' as _i7;
import 'package:location_tracker/core/logger/logger.dart' as _i20;
import 'package:location_tracker/core/success/success.dart' as _i8;
import 'package:location_tracker/domain/entities/distance_between_entity.dart'
    as _i14;
import 'package:location_tracker/domain/entities/location_entity.dart' as _i16;
import 'package:location_tracker/domain/entities/user_entity.dart' as _i9;
import 'package:location_tracker/domain/entities/websocket_payload_entity.dart'
    as _i18;
import 'package:location_tracker/domain/repositories/location_repository.dart'
    as _i4;
import 'package:location_tracker/domain/repositories/user_repository.dart'
    as _i2;
import 'package:location_tracker/domain/usecases/create_user_usecase.dart'
    as _i6;
import 'package:location_tracker/domain/usecases/delete_user_usecase.dart'
    as _i10;
import 'package:location_tracker/domain/usecases/distance_between_usecase.dart'
    as _i13;
import 'package:location_tracker/domain/usecases/generate_uid_usecase.dart'
    as _i19;
import 'package:location_tracker/domain/usecases/list_users_usecase.dart'
    as _i11;
import 'package:location_tracker/domain/usecases/on_location_changed_usecase.dart'
    as _i15;
import 'package:location_tracker/domain/usecases/on_message_usecase.dart'
    as _i17;
import 'package:location_tracker/domain/usecases/update_user_usecase.dart'
    as _i12;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: comment_references
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis

class _FakeUserRepository extends _i1.Fake implements _i2.UserRepository {}

class _FakeEither<L, R> extends _i1.Fake implements _i3.Either<L, R> {
  @override
  String toString() => super.toString();
}

class _FakeLocationRepository extends _i1.Fake
    implements _i4.LocationRepository {}

class _FakeStreamController<T> extends _i1.Fake
    implements _i5.StreamController<T> {}

/// A class which mocks [CreateUser].
///
/// See the documentation for Mockito's code generation for more information.
class MockCreateUser extends _i1.Mock implements _i6.CreateUser {
  MockCreateUser() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.UserRepository get userRepository =>
      (super.noSuchMethod(Invocation.getter(#userRepository),
          returnValue: _FakeUserRepository()) as _i2.UserRepository);
  @override
  _i5.Future<_i3.Either<_i7.Failure, _i8.Success>> call({_i9.User? params}) =>
      (super.noSuchMethod(Invocation.method(#call, [], {#params: params}),
              returnValue: Future<_i3.Either<_i7.Failure, _i8.Success>>.value(
                  _FakeEither<_i7.Failure, _i8.Success>()))
          as _i5.Future<_i3.Either<_i7.Failure, _i8.Success>>);
}

/// A class which mocks [DeleteUser].
///
/// See the documentation for Mockito's code generation for more information.
class MockDeleteUser extends _i1.Mock implements _i10.DeleteUser {
  MockDeleteUser() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.UserRepository get userRepository =>
      (super.noSuchMethod(Invocation.getter(#userRepository),
          returnValue: _FakeUserRepository()) as _i2.UserRepository);
  @override
  _i5.Future<_i3.Either<_i7.Failure, _i8.Success>> call({_i9.User? params}) =>
      (super.noSuchMethod(Invocation.method(#call, [], {#params: params}),
              returnValue: Future<_i3.Either<_i7.Failure, _i8.Success>>.value(
                  _FakeEither<_i7.Failure, _i8.Success>()))
          as _i5.Future<_i3.Either<_i7.Failure, _i8.Success>>);
}

/// A class which mocks [ListUsers].
///
/// See the documentation for Mockito's code generation for more information.
class MockListUsers extends _i1.Mock implements _i11.ListUsers {
  MockListUsers() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.UserRepository get userRepository =>
      (super.noSuchMethod(Invocation.getter(#userRepository),
          returnValue: _FakeUserRepository()) as _i2.UserRepository);
  @override
  _i5.Future<_i3.Either<_i7.Failure, _i8.Success>> call({Object? params}) =>
      (super.noSuchMethod(Invocation.method(#call, [], {#params: params}),
              returnValue: Future<_i3.Either<_i7.Failure, _i8.Success>>.value(
                  _FakeEither<_i7.Failure, _i8.Success>()))
          as _i5.Future<_i3.Either<_i7.Failure, _i8.Success>>);
}

/// A class which mocks [UpdateUser].
///
/// See the documentation for Mockito's code generation for more information.
class MockUpdateUser extends _i1.Mock implements _i12.UpdateUser {
  MockUpdateUser() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.UserRepository get userRepository =>
      (super.noSuchMethod(Invocation.getter(#userRepository),
          returnValue: _FakeUserRepository()) as _i2.UserRepository);
  @override
  _i5.Future<_i3.Either<_i7.Failure, _i8.Success>> call({_i9.User? params}) =>
      (super.noSuchMethod(Invocation.method(#call, [], {#params: params}),
              returnValue: Future<_i3.Either<_i7.Failure, _i8.Success>>.value(
                  _FakeEither<_i7.Failure, _i8.Success>()))
          as _i5.Future<_i3.Either<_i7.Failure, _i8.Success>>);
}

/// A class which mocks [DistanceBetween].
///
/// See the documentation for Mockito's code generation for more information.
class MockDistanceBetween extends _i1.Mock implements _i13.DistanceBetween {
  MockDistanceBetween() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.LocationRepository get locationRepository =>
      (super.noSuchMethod(Invocation.getter(#locationRepository),
          returnValue: _FakeLocationRepository()) as _i4.LocationRepository);
  @override
  double call({_i14.DistanceBetween? params}) =>
      (super.noSuchMethod(Invocation.method(#call, [], {#params: params}),
          returnValue: 0.0) as double);
}

/// A class which mocks [OnLocationChangedUseCase].
///
/// See the documentation for Mockito's code generation for more information.
class MockOnLocationChangedUseCase extends _i1.Mock
    implements _i15.OnLocationChangedUseCase {
  MockOnLocationChangedUseCase() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.LocationRepository get locationRepository =>
      (super.noSuchMethod(Invocation.getter(#locationRepository),
          returnValue: _FakeLocationRepository()) as _i4.LocationRepository);
  @override
  _i5.StreamController<_i16.Location> call({Object? params}) =>
      (super.noSuchMethod(Invocation.method(#call, [], {#params: params}),
              returnValue: _FakeStreamController<_i16.Location>())
          as _i5.StreamController<_i16.Location>);
}

/// A class which mocks [OnMessageUseCase].
///
/// See the documentation for Mockito's code generation for more information.
class MockOnMessageUseCase extends _i1.Mock implements _i17.OnMessageUseCase {
  MockOnMessageUseCase() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.UserRepository get userRepository =>
      (super.noSuchMethod(Invocation.getter(#userRepository),
          returnValue: _FakeUserRepository()) as _i2.UserRepository);
  @override
  _i5.StreamController<_i18.WebSocketPayload> call({Object? params}) =>
      (super.noSuchMethod(Invocation.method(#call, [], {#params: params}),
              returnValue: _FakeStreamController<_i18.WebSocketPayload>())
          as _i5.StreamController<_i18.WebSocketPayload>);
}

/// A class which mocks [GenerateUID].
///
/// See the documentation for Mockito's code generation for more information.
class MockGenerateUID extends _i1.Mock implements _i19.GenerateUID {
  MockGenerateUID() {
    _i1.throwOnMissingStub(this);
  }

  @override
  String call({Object? params}) =>
      (super.noSuchMethod(Invocation.method(#call, [], {#params: params}),
          returnValue: '') as String);
}

/// A class which mocks [Logger].
///
/// See the documentation for Mockito's code generation for more information.
class MockLogger extends _i1.Mock implements _i20.Logger {
  MockLogger() {
    _i1.throwOnMissingStub(this);
  }

  @override
  List<Object?> get props =>
      (super.noSuchMethod(Invocation.getter(#props), returnValue: <Object?>[])
          as List<Object?>);
  @override
  void print(String? log, {String? className}) => super.noSuchMethod(
      Invocation.method(#print, [log], {#className: className}),
      returnValueForMissingStub: null);
  @override
  String toString() => super.toString();
}
