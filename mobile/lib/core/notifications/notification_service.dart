import 'package:flutter/material.dart';
import 'package:location_tracker/core/themes/colors.dart';
import 'package:overlay_support/overlay_support.dart';

class AppNotifications {
  static void _showNotification(String message,
      {bool error = false,
      Color? backgroundColor,
      Duration? duration = const Duration(seconds: 3),
      bool autoDismiss = true}) {
    showSimpleNotification(
      Text(message),
      background: error ? AppColors.mediumRed : backgroundColor,
      leading: error ? Icon(Icons.info_outline) : null,
      duration: duration,
      autoDismiss: autoDismiss,
    );
  }

  static void removeToast(BuildContext context) {
    OverlaySupportEntry.of(context)?.dismiss(animate: true);
  }

  static void showToastError(String message, {Duration? duration}) {
    _showNotification(message, error: true, duration: duration);
  }

  static void showToastAlert(String message, {Duration? duration}) {
    _showNotification(message,
        error: false, duration: duration, backgroundColor: Colors.amber[600]);
  }

  static void showToastSuccess(String message, {Duration? duration}) {
    _showNotification(message,
        error: false, duration: duration, backgroundColor: Colors.teal);
  }
}
