import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

abstract class Logger extends Equatable {
  void print(String log, {String className});
  @override
  List<Object?> get props => [];
}

@Injectable(as: Logger)
class LocalLogger extends Logger {
  @override
  void print(String log, {String className = "LocalLogger"}) {
    // print("$className - $log");
  }
}
