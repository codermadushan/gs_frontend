import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../constants/app_color.dart';
import '../constants/app_size.dart';
import 'texts.dart';

sealed class AppSnackBar {
  static const _iconSize = 24.0;

  static void success({
    required BuildContext context,
    required String message,
  }) {
    final snackBar = SnackBar(
      content: Row(
        spacing: AppSize.pagePadding,
        children: [
          const Icon(
            FontAwesomeIcons.solidCircleCheck,
            size: _iconSize,
            color: AppColor.success,
          ),

          Expanded(child: AppTextH5(message, color: AppColor.success)),
        ],
      ),
      backgroundColor: Color.lerp(AppColor.popover, AppColor.success, 0.2),
    );
    ScaffoldMessenger.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(snackBar);
  }

  static void error({required BuildContext context, required String message}) {
    final snackBar = SnackBar(
      content: Row(
        spacing: AppSize.pagePadding,
        children: [
          const Icon(
            FontAwesomeIcons.solidCircleXmark,
            size: _iconSize,
            color: AppColor.destructive,
          ),

          Expanded(child: AppTextH5(message, color: AppColor.destructive)),
        ],
      ),
      backgroundColor: Color.lerp(AppColor.popover, AppColor.destructive, 0.2),
    );
    ScaffoldMessenger.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(snackBar);
  }
}
