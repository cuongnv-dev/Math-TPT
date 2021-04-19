import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomContainer extends StatelessWidget {
  final Widget childWidget;
  final double width;
  final double outsideHeight;
  final double insideHeight;
  final double borderRadius;
  final Color outsideColor;
  final Color insideColor;
  final Function onTap;
  final EdgeInsetsGeometry padding;

  const CustomContainer(
      {Key key,
      @required this.childWidget,
      @required this.width,
      @required this.outsideHeight,
      @required this.insideHeight,
      @required this.borderRadius,
      @required this.outsideColor,
      @required this.insideColor,
      @required this.onTap,
      this.padding})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: [
          Container(
            width: width,
            height: outsideHeight,
            decoration: BoxDecoration(
              color: outsideColor,
              borderRadius: BorderRadius.circular(borderRadius),
            ),
          ),
          Container(
            width: width,
            height: insideHeight,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(borderRadius),
              color: insideColor,
            ),
            padding: padding,
            child: childWidget,
          ),
        ],
      ),
    );
  }
}
