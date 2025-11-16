import 'package:flutter/material.dart';

import '../../../../../core/constants/app_color.dart';
import '../../../../../core/constants/app_size.dart';
import '../../../../../core/widgets/texts.dart';

class ReservationDetailsServices extends StatelessWidget {
  static const _circleSize = 12.0;

  final List<String> _services;

  const ReservationDetailsServices(List<String> services, {super.key})
    : _services = services;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppSize.pagePadding),

      decoration: BoxDecoration(
        color: AppColor.muted,
        borderRadius: BorderRadius.circular(AppSize.borderRadius),
      ),

      child: Column(
        spacing: AppSize.pagePadding,

        children: List.generate(_services.length, (index) {
          final service = _services[index];

          return Row(
            spacing: AppSize.pagePadding,

            children: [
              const CircleAvatar(
                radius: _circleSize / 2,
                backgroundColor: AppColor.primary,
              ),

              Expanded(
                child: AppTextH6(service, color: AppColor.mutedForeground),
              ),
            ],
          );
        }),
      ),
    );
  }
}
