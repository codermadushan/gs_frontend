import 'package:flutter/material.dart';

import '../../../../../../core/constants/app_size.dart';
import '../../../../../../core/entities/service_category_entity.dart';
import 'service_category.dart';

class ServiceCategories extends StatelessWidget {
  final List<ServiceCategoryEntity> _categories;

  const ServiceCategories(List<ServiceCategoryEntity> categories, {super.key})
    : _categories = categories;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: AppSize.gapLarge,
      children: List.generate(_categories.length, (index) {
        return ServiceCategory(_categories[index]);
      }),
    );
  }
}
