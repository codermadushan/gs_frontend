import 'package:flutter/material.dart';

import 'package:pinput/pinput.dart';

import '../../../../../core/constants/app_color.dart';
import '../../../../../core/constants/app_size.dart';
import '../../../../../core/constants/app_style.dart';

class PinInputField extends StatelessWidget {
  final TextEditingController? _controller;
  final int _length;

  const PinInputField({
    super.key,
    TextEditingController? controller,
    int length = 4,
  }) : _controller = controller,
       _length = length;

  PinTheme _pinTheme([Border? border]) {
    return PinTheme(
      width: 50,
      height: 50,
      textStyle: AppStyle.h1.copyWith(color: AppColor.mutedForeground),
      decoration: BoxDecoration(
        color: AppColor.muted,
        border: border,
        borderRadius: BorderRadius.circular(AppSize.borderRadius),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Pinput(
      controller: _controller,
      length: _length,
      focusedPinTheme: _pinTheme(Border.all(color: AppColor.ring, width: 2)),
      defaultPinTheme: _pinTheme(),
    );
  }
}
