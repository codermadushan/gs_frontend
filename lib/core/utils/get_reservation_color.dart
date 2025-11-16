import 'package:flutter/material.dart';

import '../constants/app_color.dart';
import '../enums/reservation_status.dart';

Color getReservationColor(ReservationStatus state) {
  if (state == ReservationStatus.pending) return AppColor.mutedForeground;

  if (state == ReservationStatus.rejected) return AppColor.destructive;

  return AppColor.success;
}
