import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location_tracker/core/data_injection/injectable.dart';
import 'package:location_tracker/domain/entities/location_entity.dart';
import 'package:location_tracker/domain/entities/user_entity.dart';
import 'package:location_tracker/domain/entities/websocket_payload_entity.dart';
import 'package:location_tracker/presentation/shared/components/location_loading_component.dart';
import 'package:location_tracker/presentation/shared/controller/user_controller.dart';
import 'package:rxdart/rxdart.dart';

class MapStreamContent extends StatefulWidget {
  MapStreamContent({required this.onSelect});
  final Function(User) onSelect;
  @override
  _MapStreamContentState createState() => _MapStreamContentState();
}

class _MapStreamContentState extends State<MapStreamContent> {
  //controllers
  final _userController = getIt<UserController>();
  late final StreamController<WebSocketPayload> _onMessageController;
  late final StreamController<Location> _onLocationController;

  @override
  void initState() {
    _onMessageController = _userController.onMessage();
    _onLocationController = _userController.onLocationChanged();
    super.initState();
  }

  @override
  void dispose() {
    _onMessageController.close();
    _onLocationController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Location>(
      initialData: _userController.user.location,
      stream: _onLocationController.stream.throttleTime(Duration(seconds: 1)),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          print(
              '${snapshot.data!.longitude} ${snapshot.data!.latitude} ${snapshot.data!.heading}');
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

              return GoogleMap(
                  mapType: MapType.normal,
                  initialCameraPosition: CameraPosition(
                    target: LatLng(_userController.user.location!.latitude,
                        _userController.user.location!.longitude),
                    zoom: 18,
                  ),
                  // onMapCreated: (GoogleMapControl;})ler controller) {
                  //   _controller.complete(controller);
                  // },

                  markers: snapshot.data!.connectedUsers.map((user) {
                    return Marker(
                      markerId: MarkerId(user.uid!),
                      icon: _userController.bitmaps[user.vehicle]!,
                      onTap: () => widget.onSelect(user),
                      position: LatLng(
                          user.location!.latitude, user.location!.longitude),
                      infoWindow: InfoWindow(title: user.nick),
                    );
                  }).toSet());
            }
          },
        );
      },
    );
  }
}
