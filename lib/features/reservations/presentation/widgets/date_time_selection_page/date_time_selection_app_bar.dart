import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../core/constants/app_color.dart';
import '../../../../../core/constants/app_size.dart';
import '../../../../../core/widgets/app_icon_button.dart';
import '../../../../../core/widgets/texts.dart';

class DateTimeSelectionAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const DateTimeSelectionAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(AppSize.appBarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Padding(
        padding: const EdgeInsets.only(left: AppSize.pagePadding),
        child: Center(
          child: AppIconButton(
            backgroundColor: AppColor.foreground,
            foregroundColor: AppColor.background,
            icon: const Icon(FontAwesomeIcons.arrowLeft),
            onPressed: () async {
              await Navigator.maybePop(context);
            },
          ),
        ),
      ),
      title: const AppTextH2('Reserve your spot'),
      centerTitle: true,
    );
  }
}
