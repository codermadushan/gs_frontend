import 'package:flutter/foundation.dart';

@immutable
final class ReservationData {
  final String additionalInfo;
  final int barberId;

  const ReservationData({required this.additionalInfo, required this.barberId});
}
