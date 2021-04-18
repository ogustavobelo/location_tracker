import 'package:flutter/material.dart';
import 'package:location_tracker/core/themes/colors.dart';

class HardEdgeContainer extends StatelessWidget {
  final double borderSize;
  final Color borderColor;
  final double width;
  final double height;
  final Widget child;
  HardEdgeContainer({
    required this.child,
    this.borderSize = 4.0,
    this.borderColor = AppColors.darkGrey,
    this.width: 100,
    this.height: 60,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      child: Column(
        children: [
          _topBottomLine(),
          Expanded(
            child: Row(
              children: [
                _lateralLine(),
                Expanded(
                  child: child,
                ),
                _lateralLine(),
              ],
            ),
          ),
          _topBottomLine(),
        ],
      ),
    );
  }

  Widget _lateralLine() {
    return Column(
      children: [
        Expanded(
          child: Container(
            width: borderSize,
            color: borderColor,
          ),
        ),
      ],
    );
  }

  Widget _topBottomLine() {
    return Row(
      children: [
        Container(
          height: borderSize,
          width: borderSize,
          color: Colors.transparent,
        ),
        Expanded(
          child: Container(
            height: borderSize,
            color: borderColor,
          ),
        ),
        Container(
          height: borderSize,
          width: borderSize,
          color: Colors.transparent,
        ),
      ],
    );
  }
}
