import 'package:flutter/material.dart';

import '../constants/app_color.dart';

class Loader extends StatelessWidget {
  final double? _size;
  final Color _color;
  final double _strokeWidth;

  const Loader({
    super.key,
    double? size,
    Color color = AppColor.primary,
    double strokeWidth = 4,
  }) : _size = size,
       _color = color,
       _strokeWidth = strokeWidth;

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: _size,
      child: CircularProgressIndicator(
        color: _color,
        strokeWidth: _strokeWidth,
        strokeCap: StrokeCap.round,
      ),
    );
  }
}
