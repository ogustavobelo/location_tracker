// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AppController on _AppControllerBase, Store {
  final _$locationAtom = Atom(name: '_AppControllerBase.location');

  @override
  LocationModel? get location {
    _$locationAtom.reportRead();
    return super.location;
  }

  @override
  set location(LocationModel? value) {
    _$locationAtom.reportWrite(value, super.location, () {
      super.location = value;
    });
  }

  final _$setLocationAsyncAction =
      AsyncAction('_AppControllerBase.setLocation');

  @override
  Future<void> setLocation() {
    return _$setLocationAsyncAction.run(() => super.setLocation());
  }

  @override
  String toString() {
    return '''
location: ${location}
    ''';
  }
}
