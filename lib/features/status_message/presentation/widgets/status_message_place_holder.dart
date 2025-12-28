import 'package:flutter/material.dart';

import '../../../../core/constants/app_color.dart';
import '../../../../core/constants/app_size.dart';
import '../../../../core/widgets/app_card.dart';

class StatusMessagePlaceHolder extends StatelessWidget {
  const StatusMessagePlaceHolder({super.key});

  @override
  Widget build(BuildContext context) {
    return AppCard(
      margin: const EdgeInsets.symmetric(horizontal: AppSize.pagePadding),

      padding: const EdgeInsets.all(AppSize.pagePadding),

      child: Row(
        children: [
          const CircleAvatar(radius: 10, backgroundColor: AppColor.muted),

          const SizedBox(width: AppSize.pagePadding),

          Expanded(
            child: Container(
              height: 20,
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColor.muted,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
