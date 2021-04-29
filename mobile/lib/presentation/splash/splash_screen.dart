import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:location_tracker/core/data_injection/injectable.dart';
import 'package:location_tracker/core/error/exceptions.dart';
import 'package:location_tracker/core/helpers/i18n_helper.dart';
import 'package:location_tracker/core/notifications/notification_service.dart';
import 'package:location_tracker/core/themes/colors.dart';
import 'package:location_tracker/presentation/home/home_screen.dart';
import 'package:location_tracker/presentation/shared/components/hard_edge_button.dart';
import 'package:location_tracker/presentation/shared/components/hard_edge_container.dart';
import 'package:location_tracker/presentation/shared/components/location_loading_component.dart';
import 'package:location_tracker/presentation/shared/controller/app_controller.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final AppController _appController = getIt<AppController>();

  @override
  void initState() {
    _initPermissions();
    super.initState();
  }

  String _translate(String key) {
    return I18nHelper.translate(context, "home.$key");
  }

  void _goToHome() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => HomeScreen()));
  }

  Future<void> _initPermissions() async {
    try {
      _appController.startLoading(message: 'Initing app...');
      await _appController.requestServiceLocation();
      await _appController.requestPermission();
      _goToHome();
    } catch (e) {
      final _errorMessage = e is LocationException
          ? e.message
          : _translate('errors.unablePermission');
      AppNotifications.showToastError(_errorMessage);
    } finally {
      _appController.stopLoading();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Observer(builder: (_) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (_appController.loading) ...[LocationLoading()],
              if (!_appController.locationServiceEnabled) ...[
                _bannerMessage('You need to activate your Location Service')
              ] else if (!_appController.hasPermission) ...[
                _bannerMessage('You need to provide Location Permission')
              ],
            ],
          ),
        );
      }),
    );
  }

  Widget _bannerMessage(String message) {
    return Column(
      children: [
        HardEdgeContainer(
          width: 400,
          borderColor: AppColors.darkRed,
          child: Text(
            message,
            textAlign: TextAlign.center,
            style: TextStyle(color: AppColors.darkRed),
          ),
        ),
        const SizedBox(height: 16.0),
        HardEdgeButton(
          text: 'Activate',
          width: 200,
          onPressed: _initPermissions,
        ),
      ],
    );
  }
}
