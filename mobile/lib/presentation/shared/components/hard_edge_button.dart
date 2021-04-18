import 'package:flutter/material.dart';
import 'package:location_tracker/core/themes/colors.dart';
import 'package:location_tracker/presentation/shared/components/hard_edge_container.dart';

class HardEdgeButton extends StatefulWidget {
  final double borderSize;
  final Color borderColor;
  final double width;
  final double height;
  final Color color;
  final String text;
  final Function onPressed;

  HardEdgeButton({
    required this.text,
    required this.onPressed,
    this.borderSize = 4.0,
    this.borderColor = AppColors.darkGrey,
    this.width: 100,
    this.height: 60,
    this.color = AppColors.lightOrange,
  });

  @override
  _HardEdgeButtonState createState() => _HardEdgeButtonState();
}

class _HardEdgeButtonState extends State<HardEdgeButton> {
  bool _animating = false;

  void _onClick() async {
    setState(() => _animating = true);
    await Future.delayed(Duration(milliseconds: 50));
    setState(() => _animating = false);
    widget.onPressed();
  }

  @override
  Widget build(BuildContext context) {
    return HardEdgeContainer(
      borderSize: widget.borderSize,
      borderColor: widget.borderColor,
      width: widget.width,
      height: widget.height,
      child: GestureDetector(
        onTap: _onClick,
        child: AnimatedContainer(
            duration: Duration(milliseconds: 150),
            curve: Curves.ease,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: _animating ? widget.color.withOpacity(.7) : widget.color,
                border: Border(
                  left: BorderSide(
                    width: widget.borderSize,
                    color: _animating
                        ? Colors.transparent
                        : AppColors.pureWhite.withOpacity(.5),
                  ),
                  top: BorderSide(
                    width: widget.borderSize,
                    color: _animating
                        ? Colors.transparent
                        : AppColors.pureWhite.withOpacity(.25),
                  ),
                  right: BorderSide(
                    width: widget.borderSize,
                    color: _animating
                        ? Colors.transparent
                        : AppColors.pureBlack.withOpacity(.5),
                  ),
                  bottom: BorderSide(
                    width: widget.borderSize,
                    color: _animating
                        ? Colors.transparent
                        : AppColors.pureBlack.withOpacity(.25),
                  ),
                )),
            child:
                Text(widget.text, style: TextStyle(color: widget.borderColor))),
      ),
    );
  }
}
