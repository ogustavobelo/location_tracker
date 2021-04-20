import 'package:injectable/injectable.dart';
import 'package:location_tracker/core/error/failures.dart';
import 'package:location_tracker/core/flavors/flavors.dart';
import 'package:web_socket_channel/io.dart';

abstract class WebSocketDS {
  IOWebSocketChannel get channel;
  void _connect();
}

@Injectable(as: WebSocketDS)
class WebSocketDSImpl implements WebSocketDS {
  final Flavors flavors;
  WebSocketDSImpl({
    required this.flavors,
  });
  IOWebSocketChannel? _channel;

  @override
  IOWebSocketChannel get channel {
    if (_channel == null) {
      _connect();
    }
    return _channel!;
  }

  void _connect() {
    try {
      _channel ??= IOWebSocketChannel.connect(Uri.parse(flavors.websocketUrl));
    } catch (e) {
      print(e);
      throw WebSocketFailure();
    }
  }
}
