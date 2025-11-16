import 'package:flutter/material.dart';

import '../constants/app_color.dart';
import '../constants/app_size.dart';
import 'app_text_button.dart';
import 'texts.dart';

sealed class ConfirmationDialog {
  static Future<bool?> show({
    required BuildContext context,
    Color iconColor = AppColor.destructive,
    IconData? icon,
    String? title,
    String? description,
  }) async {
    final value = await showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          icon: icon == null
              ? null
              : CircleAvatar(
                  radius: 20,
                  backgroundColor: iconColor.withAlpha(AppSize.opacityAlpha),
                  child: Icon(icon, color: iconColor),
                ),

          title: AppTextH4(
            title ?? 'Are you sure?',
            color: AppColor.popoverForeground,
            textAlign: TextAlign.center,
          ),

          content: description == null
              ? null
              : AppTextBody(
                  description,
                  textAlign: TextAlign.center,
                  color: AppColor.mutedForeground,
                ),

          backgroundColor: AppColor.popover,

          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSize.borderRadius),
          ),

          actions: [
            AppTextButton(
              onPressed: () {
                Navigator.pop(context, false);
              },
              foregroundColor: AppColor.success,
              child: const Text('No'),
            ),

            AppTextButton(
              onPressed: () {
                Navigator.pop(context, true);
              },
              foregroundColor: AppColor.destructive,
              child: const Text('Yes'),
            ),
          ],
          actionsAlignment: MainAxisAlignment.spaceBetween,
        );
      },
    );

    return value;
  }
}
