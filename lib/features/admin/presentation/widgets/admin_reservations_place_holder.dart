import 'package:flutter/material.dart';

import '../../../../core/constants/app_color.dart';
import '../../../../core/constants/app_size.dart';
import '../../../../core/widgets/app_card.dart';
import '../../../../core/widgets/app_icon_button.dart';
import '../../../../core/widgets/loader.dart';
import '../../../../core/widgets/texts.dart';

class AdminReservationsPlaceHolder extends StatelessWidget {
  final bool _isLoading;
  final String? _emptyMessage;
  final VoidCallback? _onRefresh;

  const AdminReservationsPlaceHolder({
    super.key,
    bool isLoading = false,
    String? emptyMessage,
    VoidCallback? onRefresh,
  }) : _emptyMessage = emptyMessage,
       _onRefresh = onRefresh,
       _isLoading = isLoading;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: _isLoading
          ? const Loader()
          : Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSize.pagePadding,
              ),
              child: AppCard(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSize.pagePadding * 2,
                  vertical: AppSize.pagePadding,
                ),

                child: Column(
                  spacing: AppSize.pagePadding,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AppTextH5(
                      _emptyMessage ?? 'No reservations to show at the moment',
                      color: AppColor.mutedForeground,
                      textAlign: TextAlign.center,
                    ),

                    AppIconButton(
                      icon: const Icon(Icons.refresh_rounded),
                      onPressed: _onRefresh ?? () {},
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
