import 'package:flutter/material.dart';

import '../../../../../core/constants/app_color.dart';
import '../../../../../core/constants/app_size.dart';
import '../../../../../core/widgets/texts.dart';

class ReservationDetailsRejection extends StatelessWidget {
  final String _reason;

  const ReservationDetailsRejection(String reason, {super.key})
    : _reason = reason;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppSize.pagePadding),

      decoration: BoxDecoration(
        color: AppColor.destructive.withAlpha(AppSize.opacityAlpha),
        borderRadius: BorderRadius.circular(AppSize.borderRadius),
      ),

      child: AppTextBody(
        _reason.isEmpty
            ? 'Your reservation request has been rejected. No reason was provided for this decision. Please contact us for more information'
            : _reason,
        textAlign: TextAlign.center,
        color: AppColor.destructive,
      ),
    );
  }
}
