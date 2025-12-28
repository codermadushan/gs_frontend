import 'package:flutter/material.dart';

import '../constants/app_color.dart';
import '../enums/status_message_color.dart';

Color getStatusMessageColor(String color) {
  if (color == StatusMessageColor.green.label) {
    return AppColor.success;
  } else if (color == StatusMessageColor.muted.label) {
    return AppColor.mutedForeground;
  }
  return AppColor.destructive;
}
