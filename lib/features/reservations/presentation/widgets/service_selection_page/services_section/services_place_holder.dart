import 'package:flutter/material.dart';

import '../../../../../../core/constants/app_color.dart';
import '../../../../../../core/constants/app_style.dart';
import '../../../../../../core/widgets/app_card.dart';
import '../../../../../../core/widgets/loading_message.dart';

class ServicesPlaceHolder extends StatelessWidget {
  final bool _isLoading;

  const ServicesPlaceHolder({super.key, bool isLoading = false})
    : _isLoading = isLoading;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      height: 164,
      width: double.infinity,

      child: Center(
        child: _isLoading
            ? const LoadingMessage(message: 'Services loading...')
            : Text(
                'No services available',
                style: AppStyle.h5.copyWith(color: AppColor.mutedForeground),
              ),
      ),
    );
  }
}
