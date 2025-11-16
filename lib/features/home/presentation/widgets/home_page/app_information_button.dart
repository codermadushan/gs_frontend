import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
          icon: const Icon(FontAwesomeIcons.code),
          onPressed: () async {
            await Navigator.pushNamed(context, AppRouter.appInformationPage);
          },
        ),
      ),
    );
  }
}
