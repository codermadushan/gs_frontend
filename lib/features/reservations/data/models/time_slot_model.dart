import 'package:flutter/foundation.dart';

import '../../domain/entities/time_slot_entity.dart';

@immutable
final class TimeSlotModel extends TimeSlotEntity {
  const TimeSlotModel({
    required super.id,
    required super.startAt,
    required super.endAt,
  });

  factory TimeSlotModel.fromMap(Map<String, dynamic> map) {
    return TimeSlotModel(
      id: map['id'],
      startAt: DateTime.parse(map['startAt']).toLocal(),
      endAt: DateTime.parse(map['endAt']).toLocal(),
    );
  }
}
