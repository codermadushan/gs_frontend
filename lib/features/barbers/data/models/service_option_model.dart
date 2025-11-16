import '../../../../core/entities/service_option_entity.dart';

final class ServiceOptionModel extends ServiceOptionEntity {
  const ServiceOptionModel({
    required super.id,
    required super.label,
    required super.price,
    required super.duration,
  });

  factory ServiceOptionModel.fromMap(Map<String, dynamic> map) {
    return ServiceOptionModel(
      id: map['id'],
      label: map['label'],
      price: map['price'],
      duration: map['duration'],
    );
  }
}
