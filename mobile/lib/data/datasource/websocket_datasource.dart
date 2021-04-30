import 'package:injectable/injectable.dart';
import 'package:location_tracker/core/error/failures.dart';
import 'package:location_tracker/core/flavors/flavors.dart';

// ignore: unused_import
import 'package:web_socket_channel/io.dart'
    if (dart.library.js) "package:web_socket_channel/web_socket_channel.dart";
import 'package:web_socket_channel/web_socket_channel.dart';

abstract class WebSocketDS {
  WebSocketChannel get channel;
  void connect();
}

@Injectable(as: WebSocketDS)
class WebSocketDSImpl implements WebSocketDS {
  final Flavors flavors;
  WebSocketDSImpl({
    required this.flavors,
  });
  WebSocketChannel? _channel;

  @override
  WebSocketChannel get channel {
    if (_channel == null) {
      connect();
    }
    return _channel!;
  }

  void connect() {
    try {
      _channel ??= WebSocketChannel.connect(Uri.parse(flavors.websocketUrl));
    } catch (e) {
      print(e);
      throw WebSocketFailure();
    }
  }
}
