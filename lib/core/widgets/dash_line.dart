import 'package:flutter/material.dart';

import '../constants/app_color.dart';

class DashLine extends StatelessWidget {
  final Color _color;
  final double _dashWidth;
  final double _dashHeight;
  final double _paddingHorizontal;

  const DashLine({
    super.key,
    Color color = AppColor.primary,
    double dashWidth = 6.0,
    double dashHeight = 2.0,
    double paddingHorizontal = 0,
  }) : _color = color,
       _dashWidth = dashWidth,
       _dashHeight = dashHeight,
       _paddingHorizontal = paddingHorizontal;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: _paddingHorizontal),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final itemCount =
              (constraints.maxWidth - _dashWidth) ~/ (2 * _dashWidth);

          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,

            children: List.generate(itemCount, (index) {
              return ColoredBox(
                color: _color,
                child: SizedBox(height: _dashHeight, width: _dashWidth),
              );
            }),
          );
        },
      ),
    );
  }
}
