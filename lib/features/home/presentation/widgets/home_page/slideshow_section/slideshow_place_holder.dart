import 'package:flutter/material.dart';

import '../../../../../../core/constants/app_color.dart';
import '../../../../../../core/constants/app_size.dart';

class SlideshowPlaceHolder extends StatelessWidget {
  const SlideshowPlaceHolder({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSize.pagePadding),
          child: SizedBox(
            width: double.infinity,
            height: ((width - (AppSize.pagePadding * 2)) / 16) * 9,
            child: ClipRRect(
              borderRadius: BorderRadiusGeometry.circular(AppSize.borderRadius),
              child: const ColoredBox(color: AppColor.muted),
            ),
          ),
        ),

        const SizedBox(height: AppSize.gapSmall),

        ClipRRect(
          borderRadius: BorderRadius.circular(3),
          child: const SizedBox(
            width: 192,
            height: 6,
            child: ColoredBox(color: AppColor.muted),
          ),
        ),
      ],
    );
  }
}
