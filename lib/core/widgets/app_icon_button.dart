import 'package:flutter/material.dart';

import '../constants/app_color.dart';
import '../constants/app_size.dart';

class AppIconButton extends StatelessWidget {
  final Widget _icon;
  final VoidCallback _onPressed;
  final Color _foregroundColor;
  final Color? _backgroundColor;

  const AppIconButton({
    super.key,
    required Widget icon,
    required VoidCallback onPressed,
    Color foregroundColor = AppColor.primary,
    Color? backgroundColor,
  }) : _onPressed = onPressed,
       _icon = icon,
       _foregroundColor = foregroundColor,
       _backgroundColor = backgroundColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: 40,
      child: IconButton(
        style: IconButton.styleFrom(
          foregroundColor: _foregroundColor,
          backgroundColor:
              _backgroundColor ??
              _foregroundColor.withAlpha(AppSize.opacityAlpha),
        ),
        onPressed: () async {
          await Future.delayed(
            const Duration(milliseconds: AppSize.tapDelayMs),
          );

          _onPressed();
        },
        icon: _icon,
      ),
    );
  }
}
