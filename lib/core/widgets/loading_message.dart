import 'package:flutter/material.dart';

import '../constants/app_color.dart';
import '../constants/app_style.dart';
import 'loader.dart';

class LoadingMessage extends StatelessWidget {
  final String _message;
  final Color _titleColor;
  final Color _subTitleColor;
  final Color _loaderColor;

  const LoadingMessage({
    super.key,
    required String message,
    Color titleColor = AppColor.cardForeground,
    Color subTitleColor = AppColor.mutedForeground,
    Color loaderColor = AppColor.primary,
  }) : _message = message,
       _titleColor = titleColor,
       _subTitleColor = subTitleColor,
       _loaderColor = loaderColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Loader(color: _loaderColor, size: 24, strokeWidth: 3),

        const SizedBox(height: 24),

        Text(
          _message,
          style: AppStyle.h4.copyWith(color: _titleColor),
          textAlign: TextAlign.center,
        ),

        const SizedBox(height: 8),

        Text(
          'This may take a few seconds',
          style: AppStyle.body.copyWith(color: _subTitleColor),
        ),
      ],
    );
  }
}
