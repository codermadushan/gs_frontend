import 'package:flutter/material.dart';

import '../constants/app_color.dart';

class Ring extends StatelessWidget {
  final double _ringSize;
  final double _ringWidth;
  final Color _color;

  const Ring({
    super.key,
    Color color = AppColor.primary,
    double ringSize = 12.0,
    double ringWidth = 2.0,
  }) : _ringSize = ringSize,
       _ringWidth = ringWidth,
       _color = color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: _ringSize,
      height: _ringSize,
      decoration: BoxDecoration(
        border: Border.all(width: _ringWidth, color: _color),
        shape: BoxShape.circle,
      ),
    );
  }
}
