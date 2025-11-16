import 'package:flutter/material.dart';

import '../constants/app_color.dart';

class PositionedCircle extends StatelessWidget {
  final double _circleSize;
  final double? _left;
  final double? _right;
  final double? _top;
  final Color _borderColor;

  const PositionedCircle({
    super.key,
    required double circleSize,
    Color borderColor = AppColor.border,
    double? left,
    double? right,
    double? top,
  }) : _left = left,
       _right = right,
       _top = top,
       _circleSize = circleSize,
       _borderColor = borderColor;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: _top,
      left: _left,
      right: _right,
      child: Container(
        width: _circleSize,
        height: _circleSize,
        decoration: BoxDecoration(
          color: AppColor.background,
          shape: BoxShape.circle,
          border: Border.all(color: _borderColor, width: 1),
        ),
      ),
    );
  }
}
