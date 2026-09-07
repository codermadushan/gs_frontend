import 'package:flutter/material.dart';

import '../../../../../core/app_router.dart';
import '../../../../../core/constants/app_color.dart';
import '../../../../../core/constants/app_size.dart';
import '../../../../../core/widgets/app_icon_button.dart';

class AppInformationButton extends StatelessWidget {
  const AppInformationButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: AppSize.pagePadding),
      child: Center(
        child: AppIconButton(
          foregroundColor: AppColor.background,
          backgroundColor: AppColor.foreground,
          icon: const Icon(Icons.code_rounded),
          onPressed: () async {
            await Navigator.pushNamed(context, AppRouter.appInformationPage);
          },
        ),
      ),
    );
  }
}
