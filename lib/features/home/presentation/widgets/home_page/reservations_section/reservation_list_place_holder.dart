import 'package:flutter/material.dart';

import '../../../../../../core/constants/app_color.dart';
import '../../../../../../core/constants/app_size.dart';
import '../../../../../../core/widgets/app_card.dart';
import '../../../../../../core/widgets/loading_message.dart';
import '../../../../../../core/widgets/texts.dart';

class ReservationListPlaceHolder extends StatelessWidget {
  final bool _isLoading;

  const ReservationListPlaceHolder({super.key, bool isLoading = false})
    : _isLoading = isLoading;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    final cardWidth = screenWidth - 2 * AppSize.pagePadding;
    final cardHeight = (cardWidth / 16) * 9;

    return AppCard(
      height: cardHeight,
      width: cardWidth,
      margin: const EdgeInsets.symmetric(horizontal: AppSize.pagePadding),
      child: Center(
        child: _isLoading
            ? const LoadingMessage(message: 'Reservations loading...')
            : const AppTextH5(
                'No reservations yet',
                color: AppColor.mutedForeground,
              ),
      ),
    );
  }
}
