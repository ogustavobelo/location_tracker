// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AppController on _AppControllerBase, Store {
  final _$locationAtom = Atom(name: '_AppControllerBase.location');

  @override
  Location? get location {
    _$locationAtom.reportRead();
    return super.location;
  }

  @override
  set location(Location? value) {
    _$locationAtom.reportWrite(value, super.location, () {
      super.location = value;
    });
  }

  final _$hasPermissionAtom = Atom(name: '_AppControllerBase.hasPermission');

  @override
  bool get hasPermission {
    _$hasPermissionAtom.reportRead();
    return super.hasPermission;
  }

  @override
  set hasPermission(bool value) {
    _$hasPermissionAtom.reportWrite(value, super.hasPermission, () {
      super.hasPermission = value;
    });
  }

  final _$locationServiceEnabledAtom =
      Atom(name: '_AppControllerBase.locationServiceEnabled');

  @override
  bool get locationServiceEnabled {
    _$locationServiceEnabledAtom.reportRead();
    return super.locationServiceEnabled;
  }

  @override
  set locationServiceEnabled(bool value) {
    _$locationServiceEnabledAtom
        .reportWrite(value, super.locationServiceEnabled, () {
      super.locationServiceEnabled = value;
    });
  }

  final _$loadingAtom = Atom(name: '_AppControllerBase.loading');

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  final _$loadingMessageAtom = Atom(name: '_AppControllerBase.loadingMessage');

  @override
  String get loadingMessage {
    _$loadingMessageAtom.reportRead();
    return super.loadingMessage;
  }

  @override
  set loadingMessage(String value) {
    _$loadingMessageAtom.reportWrite(value, super.loadingMessage, () {
      super.loadingMessage = value;
    });
  }

  final _$setLocationAsyncAction =
      AsyncAction('_AppControllerBase.setLocation');

  @override
  Future<void> setLocation() {
    return _$setLocationAsyncAction.run(() => super.setLocation());
  }

  final _$requestPermissionAsyncAction =
      AsyncAction('_AppControllerBase.requestPermission');

  @override
  Future<void> requestPermission() {
    return _$requestPermissionAsyncAction.run(() => super.requestPermission());
  }

  final _$requestServiceLocationAsyncAction =
      AsyncAction('_AppControllerBase.requestServiceLocation');

  @override
  Future<void> requestServiceLocation() {
    return _$requestServiceLocationAsyncAction
        .run(() => super.requestServiceLocation());
  }

  final _$_AppControllerBaseActionController =
      ActionController(name: '_AppControllerBase');

  @override
  void startLoading({String message = "Loading"}) {
    final _$actionInfo = _$_AppControllerBaseActionController.startAction(
        name: '_AppControllerBase.startLoading');
    try {
      return super.startLoading(message: message);
    } finally {
      _$_AppControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void stopLoading() {
    final _$actionInfo = _$_AppControllerBaseActionController.startAction(
        name: '_AppControllerBase.stopLoading');
    try {
      return super.stopLoading();
    } finally {
      _$_AppControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
location: ${location},
hasPermission: ${hasPermission},
locationServiceEnabled: ${locationServiceEnabled},
loading: ${loading},
loadingMessage: ${loadingMessage}
    ''';
  }
}
