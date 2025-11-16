import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../enums/reservation_status.dart';

IconData getReservationIcon(ReservationStatus state) {
  if (state == ReservationStatus.pending) return FontAwesomeIcons.clock;

  if (state == ReservationStatus.rejected) return FontAwesomeIcons.xmark;

  return FontAwesomeIcons.check;
}
