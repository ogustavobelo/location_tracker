import 'package:flutter/material.dart';
import 'package:location_tracker/core/constants/fonts.dart';
import 'package:location_tracker/core/themes/colors.dart';
import 'package:location_tracker/presentation/shared/components/hard_edge_container.dart';

class HardEdgeTextField extends StatelessWidget {
  final TextEditingController controller;
  HardEdgeTextField({required this.controller});
  @override
  Widget build(BuildContext context) {
    return HardEdgeContainer(
      height: 45,
      child: Container(
        padding: const EdgeInsets.only(left: 8.0, bottom: 4.0),
        color: AppColors.darkBlueGrey,
        child: Center(
          child: TextField(
            controller: controller,
            style: TextStyle(
              fontFamily: Fonts.pressStart,
              fontSize: 14,
            ),
            cursorHeight: 22.0,
            textAlignVertical: TextAlignVertical.top,
            decoration: InputDecoration(
                focusColor: Colors.transparent, border: InputBorder.none),
          ),
        ),
      ),
    );
  }
}
