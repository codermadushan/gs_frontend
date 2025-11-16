import 'package:flutter/foundation.dart';

import '../enums/reservation_status.dart';

@immutable
class UserReservationEntity {
  final int id;
  final DateTime date;
  final DateTime startAt;
  final DateTime endAt;
  final int estimatedPrice;
  final String additionalInfo;
  final ReservationStatus status;
  final String rejectionReason;
  final String barberName;
  final String barberImageUrl;
  final List<String> options;

  const UserReservationEntity({
    required this.id,
    required this.date,
    required this.startAt,
    required this.endAt,
    required this.estimatedPrice,
    required this.additionalInfo,
    required this.status,
    required this.rejectionReason,
    required this.barberName,
    required this.barberImageUrl,
    required this.options,
  });
}
