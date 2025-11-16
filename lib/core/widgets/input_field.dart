import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../constants/app_color.dart';
import '../constants/app_size.dart';
import '../constants/app_style.dart';

class InputField extends StatelessWidget {
  final String? _hintText;
  final bool _enabled;
  final String? Function(String? input)? _validator;
  final TextEditingController? _controller;
  final TextAlign _textAlign;
  final TextInputType? _keyboardType;
  final int? _lines;
  final void Function(String)? _onChanged;
  final List<TextInputFormatter>? _inputFormatters;

  const InputField({
    super.key,
    String? hintText,
    bool enabled = true,
    String? Function(String? input)? validator,
    TextEditingController? controller,
    TextAlign textAlign = TextAlign.start,
    TextInputType? keyboardType,
    int? lines,
    List<TextInputFormatter>? inputFormatters,
    void Function(String)? onChanged,
  }) : _enabled = enabled,
       _hintText = hintText,
       _validator = validator,
       _controller = controller,
       _textAlign = textAlign,
       _keyboardType = keyboardType,
       _lines = lines,
       _onChanged = onChanged,
       _inputFormatters = inputFormatters;

  OutlineInputBorder _border({required Color borderColor}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppSize.borderRadius),
      borderSide: BorderSide(width: 2, color: borderColor),
    );
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textAlign: _textAlign,
      keyboardType: _keyboardType,
      textInputAction: TextInputAction.done,
      onTapOutside: (event) {
        FocusScope.of(context).unfocus();
      },
      inputFormatters: _inputFormatters,
      style: AppStyle.h5,
      controller: _controller,
      cursorColor: AppColor.ring,
      validator: _validator,
      minLines: _lines,
      maxLines: _lines,
      onChanged: _onChanged,
      decoration: InputDecoration(
        hintText: _hintText,
        hintStyle: AppStyle.h5.copyWith(color: AppColor.mutedForeground),

        enabled: _enabled,

        enabledBorder: _border(borderColor: AppColor.input),

        disabledBorder: _border(borderColor: AppColor.muted),

        focusedBorder: _border(borderColor: AppColor.ring),

        errorBorder: _border(borderColor: AppColor.destructive),
        focusedErrorBorder: _border(borderColor: AppColor.destructive),
        errorStyle: const TextStyle(color: AppColor.destructive, fontSize: 12),
      ),
    );
  }
}
