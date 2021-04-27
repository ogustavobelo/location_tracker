import 'package:flutter/material.dart';

class LocationLoading extends StatelessWidget {
  final String? message;
  const LocationLoading({
    Key? key,
    this.message,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(),
          if (message != null) ...[
            const SizedBox(width: 8.0),
            Text(message!),
          ]
        ],
      ),
    );
  }
}
