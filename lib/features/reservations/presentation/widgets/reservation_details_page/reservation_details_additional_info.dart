import 'package:flutter/material.dart';

import '../../../../../core/constants/app_color.dart';
import '../../../../../core/constants/app_size.dart';
import '../../../../../core/widgets/texts.dart';

class ReservationDetailsAdditionalInfo extends StatelessWidget {
  final String _info;

  const ReservationDetailsAdditionalInfo(String info, {super.key})
    : _info = info;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppSize.pagePadding),
      decoration: BoxDecoration(
        color: AppColor.muted,
        borderRadius: BorderRadius.circular(AppSize.borderRadius),
      ),
      child: AppTextBody(
        _info,
        textAlign: TextAlign.center,
        color: AppColor.mutedForeground,
      ),
    );
  }
}
