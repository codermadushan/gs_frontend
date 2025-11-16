import 'package:flutter/material.dart';

import '../constants/app_color.dart';
import '../constants/app_size.dart';

class AppCard extends StatelessWidget {
  final Widget? _child;
  final double? _width;
  final double? _height;
  final EdgeInsets? _padding;
  final EdgeInsets? _margin;
  final Color _borderColor;

  const AppCard({
    super.key,
    Color borderColor = AppColor.border,
    double? width,
    double? height,
    Widget? child,
    EdgeInsets? padding,
    EdgeInsets? margin,
  }) : _child = child,
       _width = width,
       _borderColor = borderColor,
       _height = height,
       _padding = padding,
       _margin = margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: _padding,
      margin: _margin,
      width: _width,
      height: _height,
      decoration: BoxDecoration(
        color: AppColor.card,
        border: Border.all(color: _borderColor),
        borderRadius: BorderRadius.circular(AppSize.borderRadius),
      ),
      child: _child,
    );
  }
}
