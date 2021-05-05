import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:location_tracker/core/data_injection/injectable.dart';
import 'package:location_tracker/core/themes/colors.dart';
import 'package:location_tracker/presentation/shared/components/hard_edge_container.dart';
import 'package:location_tracker/presentation/shared/controller/app_controller.dart';

class NoInternetBanner extends StatefulWidget {
  @override
  _NoInternetBannerState createState() => _NoInternetBannerState();
}

class _NoInternetBannerState extends State<NoInternetBanner> {
  late final StreamController<bool> _onConnectivityChange;
  final _appController = getIt<AppController>();

  @override
  void initState() {
    _onConnectivityChange = _appController.onConnectivityChange();
    super.initState();
  }

  @override
  void dispose() {
    _onConnectivityChange.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
        initialData: true,
        stream: _onConnectivityChange.stream,
        builder: (context, snapshot) {
          if (snapshot.hasData && !snapshot.data!) {
            return Container(
              margin: const EdgeInsets.all(24.0),
              child: HardEdgeContainer(
                width: 400,
                height: 200,
                borderColor: AppColors.mediumRed,
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  color: AppColors.darkRed.withOpacity(.5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(Icons.report_gmailerrorred_outlined, size: 64),
                      Text(
                        'No internet Connection!'.toUpperCase(),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            );
          } else {
            return Container();
          }
        });
  }
}
