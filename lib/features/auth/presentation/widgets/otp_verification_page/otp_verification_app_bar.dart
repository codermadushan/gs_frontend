import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
            icon: const Icon(FontAwesomeIcons.arrowLeft),
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
