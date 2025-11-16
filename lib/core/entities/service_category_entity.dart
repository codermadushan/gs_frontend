import 'package:flutter/foundation.dart';

import 'service_option_entity.dart';

@immutable
class ServiceCategoryEntity {
  final int id;
  final String label;
  final List<ServiceOptionEntity> serviceOptions;

  const ServiceCategoryEntity({
    required this.id,
    required this.label,
    required this.serviceOptions,
  });
}
