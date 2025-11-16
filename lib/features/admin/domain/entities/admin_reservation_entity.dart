import 'package:flutter/foundation.dart';

import '../../../../core/enums/reservation_status.dart';

@immutable
class AdminReservationEntity {
  final int id;
  final String authorName;
  final DateTime date;
  final DateTime startAt;
  final DateTime endAt;
  final ReservationStatus status;
  final int estimatedPrice;
  final String additionalInfo;
  final String barberName;
  final String barberImageUrl;
  final List<String> options;

  const AdminReservationEntity({
    required this.id,
    required this.authorName,
    required this.date,
    required this.startAt,
    required this.endAt,
    required this.status,
    required this.estimatedPrice,
    required this.additionalInfo,
    required this.barberName,
    required this.barberImageUrl,
    required this.options,
  });
}
