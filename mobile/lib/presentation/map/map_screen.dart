import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:location_tracker/core/data_injection/injectable.dart';
import 'package:location_tracker/domain/entities/websocket_payload_entity.dart';
import 'package:location_tracker/presentation/shared/controller/user_controller.dart';

class MapScreen extends StatelessWidget {
  final _userController = getIt<UserController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('MapScreen')),
        body: Column(
          children: [
            StreamBuilder<WebSocketPayload>(
              stream: _userController.onMessage(),
              builder: (context, snapshot) {
                if (!snapshot.hasData || snapshot.hasError) {
                  print(snapshot.error);
                  return Text('Has no Available Data');
                } else {
                  return Text(
                      'users length ${snapshot.data!.connectedUsers.length}');
                }
              },
            ),
          ],
        ));
  }
}
