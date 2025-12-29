import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../core/constants/app_color.dart';
import '../../../../core/enums/status_message_color.dart';

Color _getColor(StatusMessageColor color) {
  switch (color) {
    case StatusMessageColor.green:
      return AppColor.success;

    case StatusMessageColor.red:
      return AppColor.destructive;

    case StatusMessageColor.muted:
      return AppColor.mutedForeground;
  }
}

class ColorCircle extends StatelessWidget {
  final StatusMessageColor _color;
  final StatusMessageColor? _selectedColor;
  final ValueSetter<StatusMessageColor> _updateSelectedColor;

  const ColorCircle({
    super.key,
    required StatusMessageColor color,
    StatusMessageColor? selectedColor,
    required ValueSetter<StatusMessageColor> updateSelectedColor,
  }) : _color = color,
       _selectedColor = selectedColor,
       _updateSelectedColor = updateSelectedColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _updateSelectedColor(_color);
      },
      child: CircleAvatar(
        backgroundColor: _getColor(_color),
        radius: 25,
        child: _color == _selectedColor
            ? const Icon(FontAwesomeIcons.check, color: AppColor.background)
            : null,
      ),
    );
  }
}
