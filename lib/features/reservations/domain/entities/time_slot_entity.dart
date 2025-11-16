import 'package:flutter/foundation.dart';

@immutable
class TimeSlotEntity {
  final int id;
  final DateTime startAt;
  final DateTime endAt;

  const TimeSlotEntity({
    required this.id,
    required this.startAt,
    required this.endAt,
  });
}
