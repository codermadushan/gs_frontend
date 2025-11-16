import 'package:flutter/material.dart';

import '../../../../../../core/constants/app_color.dart';
import '../../../../../../core/constants/app_size.dart';
import '../../../../../../core/widgets/app_card.dart';
import '../../../../../../core/widgets/loading_message.dart';
import '../../../../../../core/widgets/texts.dart';

class AvailableSlotsPlaceHolder extends StatelessWidget {
  final bool _isLoading;

  const AvailableSlotsPlaceHolder({super.key, bool isLoading = false})
    : _isLoading = isLoading;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      height: 140,
      width: double.infinity,
      padding: const EdgeInsets.all(AppSize.pagePadding),
      child: Center(
        child: _isLoading
            ? const LoadingMessage(message: 'Time Slots loading...')
            : const AppTextH5(
                "Unfortunately, we don't have any available time slots at the moment",
                color: AppColor.mutedForeground,
                textAlign: TextAlign.center,
              ),
      ),
    );
  }
}
