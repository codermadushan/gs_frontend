import 'package:flutter/material.dart';

import '../constants/app_color.dart';
import '../constants/app_size.dart';
import 'loader.dart';
import 'texts.dart';

class MainButton extends StatelessWidget {
  final VoidCallback _onPressed;
  final String _label;
  final IconData? _icon;
  final bool _isDisabled;
  final bool _isLoading;
  final Color _foregroundColor;
  final Color _backgroundColor;

  const MainButton({
    super.key,
    required VoidCallback onPressed,
    required String label,
    Color foregroundColor = AppColor.primaryForeground,
    Color backgroundColor = AppColor.primary,
    IconData? icon,
    bool isDisabled = false,
    bool isLoading = false,
  }) : _onPressed = onPressed,
       _label = label,
       _icon = icon,
       _isLoading = isLoading,
       _isDisabled = isDisabled,
       _foregroundColor = foregroundColor,
       _backgroundColor = backgroundColor;

  @override
  Widget build(BuildContext context) {
    return FilledButton.icon(
      style: FilledButton.styleFrom(
        backgroundColor: _backgroundColor,
        foregroundColor: _foregroundColor,
        disabledBackgroundColor: AppColor.muted,
        disabledForegroundColor: AppColor.mutedForeground,
        minimumSize: const Size.fromHeight(50),
      ),
      onPressed: _isDisabled || _isLoading
          ? null
          : () async {
              await Future.delayed(
                const Duration(milliseconds: AppSize.tapDelayMs),
              );

              _onPressed();
            },
      label: _isLoading
          ? const Loader(
              size: 24,
              color: AppColor.mutedForeground,
              strokeWidth: 3,
            )
          : AppTextH5(
              _label,
              color: _isDisabled ? AppColor.mutedForeground : _foregroundColor,
            ),
      icon: _icon == null || _isLoading ? null : Icon(_icon, size: 24),
    );
  }
}
