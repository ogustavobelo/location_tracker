import 'package:equatable/equatable.dart';

abstract class Exception extends Equatable {
  final String message;
  Exception({required this.message});
  @override
  List<Object> get props => [message];
}

class LocationException extends Exception {
  LocationException(String message) : super(message: message);
}

class UserException extends Exception {
  UserException(String message) : super(message: message);
}
