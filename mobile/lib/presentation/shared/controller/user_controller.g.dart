// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$UserController on _UserControllerBase, Store {
  final _$userAtom = Atom(name: '_UserControllerBase.user');

  @override
  User get user {
    _$userAtom.reportRead();
    return super.user;
  }

  @override
  set user(User value) {
    _$userAtom.reportWrite(value, super.user, () {
      super.user = value;
    });
  }

  final _$selectedUserAtom = Atom(name: '_UserControllerBase.selectedUser');

  @override
  User? get selectedUser {
    _$selectedUserAtom.reportRead();
    return super.selectedUser;
  }

  @override
  set selectedUser(User? value) {
    _$selectedUserAtom.reportWrite(value, super.selectedUser, () {
      super.selectedUser = value;
    });
  }

  final _$bitmapsAtom = Atom(name: '_UserControllerBase.bitmaps');

  @override
  Map<String, BitmapDescriptor> get bitmaps {
    _$bitmapsAtom.reportRead();
    return super.bitmaps;
  }

  @override
  set bitmaps(Map<String, BitmapDescriptor> value) {
    _$bitmapsAtom.reportWrite(value, super.bitmaps, () {
      super.bitmaps = value;
    });
  }

  final _$getBitmapImageAsyncAction =
      AsyncAction('_UserControllerBase.getBitmapImage');

  @override
  Future<void> getBitmapImage() {
    return _$getBitmapImageAsyncAction.run(() => super.getBitmapImage());
  }

  final _$_UserControllerBaseActionController =
      ActionController(name: '_UserControllerBase');

  @override
  void setUser(User updatedUser) {
    final _$actionInfo = _$_UserControllerBaseActionController.startAction(
        name: '_UserControllerBase.setUser');
    try {
      return super.setUser(updatedUser);
    } finally {
      _$_UserControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSelectedUser(User? user) {
    final _$actionInfo = _$_UserControllerBaseActionController.startAction(
        name: '_UserControllerBase.setSelectedUser');
    try {
      return super.setSelectedUser(user);
    } finally {
      _$_UserControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
user: ${user},
selectedUser: ${selectedUser},
bitmaps: ${bitmaps}
    ''';
  }
}
