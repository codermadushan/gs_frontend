import 'package:flutter/material.dart';

import '../../../../core/constants/app_color.dart';
import '../../../../core/constants/app_size.dart';

class StatusMessagePlaceHolder extends StatelessWidget {
  const StatusMessagePlaceHolder({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: AppSize.pagePadding),

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

        const SizedBox(width: AppSize.pagePadding),
      ],
    );
  }
}
