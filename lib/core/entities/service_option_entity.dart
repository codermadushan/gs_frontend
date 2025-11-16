import 'package:flutter/foundation.dart';

@immutable
class ServiceOptionEntity {
  final int id;
  final String label;
  final int price;
  final int duration;

  const ServiceOptionEntity({
    required this.id,
    required this.label,
    required this.price,
    required this.duration,
  });
}
