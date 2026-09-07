import 'package:flutter/material.dart';

import '../enums/reservation_status.dart';

IconData getReservationIcon(ReservationStatus state) {
  if (state == ReservationStatus.pending) return Icons.access_time_rounded;

  if (state == ReservationStatus.rejected) return Icons.close_rounded;

  return Icons.check_rounded;
}
