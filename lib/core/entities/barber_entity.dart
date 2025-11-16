import 'package:flutter/foundation.dart';

@immutable
class BarberEntity {
  final int id;
  final String name;
  final String imageUrl;

  const BarberEntity({
    required this.id,
    required this.name,
    required this.imageUrl,
  });
}
