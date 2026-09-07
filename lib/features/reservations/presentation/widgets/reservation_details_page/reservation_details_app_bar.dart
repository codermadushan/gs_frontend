import 'package:flutter/material.dart';

import '../../../../../core/constants/app_color.dart';
import '../../../../../core/constants/app_size.dart';
import '../../../../../core/widgets/app_icon_button.dart';
import '../../../../../core/widgets/texts.dart';

class ReservationDetailsAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const ReservationDetailsAppBar({super.key});

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
            icon: const Icon(Icons.arrow_back_ios_rounded),
            onPressed: () async {
              await Navigator.maybePop(context);
            },
          ),
        ),
      ),
      title: const AppTextH2('Reservation Details'),
      centerTitle: true,
    );
  }
}
