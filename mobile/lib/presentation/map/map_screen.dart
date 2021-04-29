import 'dart:async';

import 'package:flutter/material.dart';
import 'package:location_tracker/core/data_injection/injectable.dart';
import 'package:location_tracker/core/helpers/i18n_helper.dart';
import 'package:location_tracker/domain/entities/location_entity.dart';
import 'package:location_tracker/domain/entities/websocket_payload_entity.dart';
import 'package:location_tracker/presentation/shared/components/location_loading_component.dart';
import 'package:location_tracker/presentation/shared/components/user_tile_component.dart';
import 'package:location_tracker/presentation/shared/controller/user_controller.dart';
import 'package:rxdart/rxdart.dart';

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final _userController = getIt<UserController>();
  late final StreamController<WebSocketPayload> _onMessageController;
  late final StreamController<Location> _onLocationController;

  @override
  void initState() {
    _onMessageController = _userController.onMessage();
    _onLocationController = _userController.onLocationChanged();
    _reload();
    super.initState();
  }

  @override
  void dispose() {
    _onMessageController.close();
    _onLocationController.close();
    super.dispose();
  }

  String _translate(String key) {
    return I18nHelper.translate(context, key);
  }

  void _reload() async {
    _userController.listUsers((key) => _translate(key));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('MapScreen'),
          actions: [
            IconButton(
              icon: Icon(Icons.refresh),
              onPressed: _reload,
            ),
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: StreamBuilder<Location>(
                initialData: _userController.user.location,
                stream: _onLocationController.stream
                    .throttleTime(Duration(seconds: 1)),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    print(
                        '${snapshot.data!.longitude} ${snapshot.data!.latitude}');
                    _userController.updateLocation(snapshot.data!);
                  }
                  return StreamBuilder<WebSocketPayload>(
                    stream: _onMessageController.stream,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting)
                        return LocationLoading();
                      if (!snapshot.hasData || snapshot.hasError) {
                        print(snapshot.error);
                        return Text('Has no Available Data');
                      } else {
                        if (snapshot.data!.connectedUsers.isEmpty) {
                          return Text('No Connected Users');
                        }

                        return ListView.builder(
                            shrinkWrap: true,
                            itemCount: snapshot.data!.connectedUsers.length,
                            itemBuilder: (context, index) {
                              final user = snapshot.data!.connectedUsers[index];
                              return UserTile(user);
                            });
                      }
                    },
                  );
                },
              ),
            ),
          ],
        ));
  }
}
