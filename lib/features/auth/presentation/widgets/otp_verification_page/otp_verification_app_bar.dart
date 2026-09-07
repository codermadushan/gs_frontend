import 'package:flutter/material.dart';

import '../../../../../core/constants/app_color.dart';
import '../../../../../core/constants/app_size.dart';
import '../../../../../core/constants/app_style.dart';
import '../../../../../core/widgets/app_icon_button.dart';

class OtpVerificationAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const OtpVerificationAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(AppSize.appBarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Padding(
        padding: const EdgeInsets.only(left: AppSize.pagePadding),
        child: Center(
          child: AppIconButton(
            onPressed: () async {
              await Navigator.maybePop(context);
            },
            icon: const Icon(Icons.arrow_back_ios_rounded),
            foregroundColor: AppColor.background,
            backgroundColor: AppColor.foreground,
          ),
        ),
      ),
      title: const Text('Verification', style: AppStyle.h2),
      centerTitle: true,
    );
  }
}
