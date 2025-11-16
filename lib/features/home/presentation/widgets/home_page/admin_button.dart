import 'package:flutter/material.dart';

import '../../../../../core/app_router.dart';
import '../../../../../core/constants/app_color.dart';
import '../../../../../core/widgets/app_icon_button.dart';

class AdminButton extends StatelessWidget {
  const AdminButton({super.key});

  @override
  Widget build(BuildContext context) {
    return AppIconButton(
      backgroundColor: AppColor.destructive,
      foregroundColor: AppColor.foreground,
      icon: const Icon(Icons.admin_panel_settings_rounded),
      onPressed: () async {
        await Navigator.pushNamed(context, AppRouter.acceptedReservationsPage);
      },
    );
  }
}
