import 'package:flutter/material.dart';

import '../../../../../../core/widgets/app_card.dart';
import '../../../../../../core/constants/app_color.dart';
import '../../../../../../core/constants/app_size.dart';

class BarberListPlaceHolder extends StatelessWidget {
  const BarberListPlaceHolder({super.key});

  @override
  Widget build(BuildContext context) {
    return AppCard(
      padding: const EdgeInsets.symmetric(horizontal: AppSize.pagePadding),
      margin: const EdgeInsets.symmetric(horizontal: AppSize.pagePadding),
      width: double.infinity,
      height: AppSize.barberImageSize + (AppSize.pagePadding * 2),
      child: SizedBox.square(
        dimension: AppSize.barberImageSize,
        child: Row(
          spacing: AppSize.pagePadding,
          children: [
            // Image place holder
            ClipRRect(
              borderRadius: BorderRadiusGeometry.circular(AppSize.borderRadius),
              child: const SizedBox.square(
                dimension: AppSize.barberImageSize,
                child: ColoredBox(color: AppColor.muted),
              ),
            ),

            // Name place holder
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadiusGeometry.circular(25 / 2),
                child: const SizedBox(
                  width: double.infinity,
                  height: 25,
                  child: ColoredBox(color: AppColor.muted),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
