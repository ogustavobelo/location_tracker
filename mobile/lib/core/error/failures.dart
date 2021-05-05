import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  @override
  List<Object> get props => [];
}

class LocationFailure extends Failure {}

class UserFailure extends Failure {}

class ConnectivityFailure extends Failure {}

class WebSocketFailure extends Failure {}
