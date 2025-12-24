import 'package:flutter/material.dart';

import '../constants/app_color.dart';
import '../enums/status_color.dart';

Color getStatusColor(StatusColor statusColor) {
  switch (statusColor) {
    case StatusColor.green:
      return AppColor.success;

    case StatusColor.red:
      return AppColor.destructive;

    case StatusColor.muted:
      return AppColor.mutedForeground;
  }
}
