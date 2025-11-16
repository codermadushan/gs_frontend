import '../../../../core/entities/service_category_entity.dart';
import 'service_option_model.dart';

final class ServiceCategoryModel extends ServiceCategoryEntity {
  const ServiceCategoryModel({
    required super.id,
    required super.label,
    required super.serviceOptions,
  });

  factory ServiceCategoryModel.fromMap(Map<String, dynamic> map) {
    return ServiceCategoryModel(
      id: map['id'],
      label: map['label'],
      serviceOptions: (map['serviceOptions'] as List<dynamic>).map((option) {
        return ServiceOptionModel.fromMap(option);
      }).toList(),
    );
  }
}
