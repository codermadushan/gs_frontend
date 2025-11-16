import 'package:flutter/material.dart';

import '../constants/app_color.dart';
import '../constants/app_size.dart';

class TappableCard extends StatelessWidget {
  final EdgeInsetsGeometry _padding;
  final Widget? _child;
  final double? _width;
  final double? _height;
  final VoidCallback? _onTap;
  final EdgeInsetsGeometry? _margin;
  final Color _borderColor;

  const TappableCard({
    super.key,
    double? width,
    double? height,
    Widget? child,
    EdgeInsetsGeometry? margin,
    EdgeInsetsGeometry padding = const EdgeInsets.all(0),
    Color borderColor = AppColor.border,
    VoidCallback? onTap,
  }) : _child = child,
       _width = width,
       _height = height,
       _padding = padding,
       _onTap = onTap,
       _margin = margin,
       _borderColor = borderColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: _margin,
      width: _width,
      height: _height,
      decoration: BoxDecoration(
        color: AppColor.card,
        border: Border.all(color: _borderColor),
        borderRadius: BorderRadius.circular(AppSize.borderRadius),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: _onTap == null
              ? null
              : () async {
                  await Future.delayed(
                    const Duration(milliseconds: AppSize.tapDelayMs),
                  );

                  _onTap();
                },
          borderRadius: BorderRadius.circular(AppSize.borderRadius),
          splashColor: AppColor.primary.withAlpha(30), // 12%
          highlightColor: AppColor.primary.withAlpha(20), // 8%
          child: Padding(padding: _padding, child: _child),
        ),
      ),
    );
  }
}
