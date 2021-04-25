import 'package:injectable/injectable.dart';

abstract class Flavors {
  String get websocketUrl;
}

@Injectable(as: Flavors)
class FlavorsDev implements Flavors {
  @override
  String get websocketUrl => 'wss://go-location-tracker.herokuapp.com/ws';
  // String get websocketUrl => 'ws://127.0.0.1:8080/ws';
}
