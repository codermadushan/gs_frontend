import 'package:flutter/material.dart';

@immutable
class StatusMessageEntity {
  final String message;
  final Color color;

  const StatusMessageEntity({required this.message, required this.color});
}
