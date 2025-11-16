import 'package:flutter/material.dart';

import '../../../../../../core/constants/app_color.dart';
import '../../../../../../core/entities/service_category_entity.dart';
import '../../../../../../core/widgets/texts.dart';
import 'service_option.dart';

class ServiceCategory extends StatelessWidget {
  final ServiceCategoryEntity _serviceCategory;

  const ServiceCategory(ServiceCategoryEntity serviceCategory, {super.key})
    : _serviceCategory = serviceCategory;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppTextH4(_serviceCategory.label, color: AppColor.primary),

        ...List.generate(_serviceCategory.serviceOptions.length, (index) {
          final option = _serviceCategory.serviceOptions[index];

          return ServiceOption(option);
        }),
      ],
    );
  }
}
