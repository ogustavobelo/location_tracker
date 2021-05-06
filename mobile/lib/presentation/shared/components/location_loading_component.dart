import 'package:flare_flutter/flare_actor.dart';
import 'package:flare_flutter/flare_cache_builder.dart';
import 'package:flare_flutter/provider/asset_flare.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LocationLoading extends StatelessWidget {
  final String? message;
  const LocationLoading({
    Key? key,
    this.message,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: FlareCacheBuilder(
        [
          AssetFlare(
              bundle: rootBundle, name: "assets/animations/pin_rotation.flr"),
        ],
        builder: (context, loaded) {
          return FlareActor(
            'assets/animations/pin_rotation.flr',
            animation: 'loading',
          );
        },
      ),
    );
  }
}
