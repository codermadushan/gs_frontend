import 'package:flutter/material.dart';

import '../constants/app_color.dart';
import '../constants/app_size.dart';

class AppTextButton extends StatelessWidget {
  final VoidCallback _onPressed;
  final Widget _child;
  final Color? _foregroundColor;
  final Color? _backgroundColor;

  const AppTextButton({
    super.key,
    required VoidCallback onPressed,
    required Widget child,
    Color? foregroundColor,
    Color? backgroundColor,
  }) : _onPressed = onPressed,
       _child = child,
       _foregroundColor = foregroundColor,
       _backgroundColor = backgroundColor;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        foregroundColor: _foregroundColor ?? AppColor.primary,
        backgroundColor: _backgroundColor,
      ),

      onPressed: () async {
        await Future.delayed(const Duration(milliseconds: AppSize.tapDelayMs));

        _onPressed();
      },

      child: _child,
    );
  }
}
