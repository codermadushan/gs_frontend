import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../app_router.dart';
import '../constants/app_color.dart';
import '../cubits/app_user/app_user_cubit.dart';
import '../enums/user_role.dart';
import 'app_icon_button.dart';
import 'confirmation_dialog.dart';

class SignOutButton extends StatefulWidget {
  const SignOutButton({super.key});

  @override
  State<SignOutButton> createState() => _SignOutButtonState();
}

class _SignOutButtonState extends State<SignOutButton> {
  late final AppUserCubit _appUserCubit;

  late final UserRole _userRole;

  @override
  void initState() {
    super.initState();

    _appUserCubit = context.read<AppUserCubit>();

    _userRole = (_appUserCubit.state as AppUserSuccess).user.role;
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AppUserCubit, AppUserState>(
      listener: (context, state) async {
        if (state is AppUserInitial) {
          await Navigator.pushNamedAndRemoveUntil(
            context,
            AppRouter.loginPage,
            (route) => false,
          );
        }
      },
      child: AppIconButton(
        foregroundColor: _userRole == UserRole.admin
            ? AppColor.background
            : AppColor.foreground,
        backgroundColor: _userRole == UserRole.admin
            ? AppColor.foreground
            : AppColor.destructive,
        onPressed: () async {
          final confirmed = await ConfirmationDialog.show(
            context: context,
            icon: Icons.logout_rounded,
            description: 'Do you really want to exit?',
          );

          if (confirmed == null || !confirmed) return;

          _appUserCubit.logOut();
        },
        icon: const Icon(Icons.logout_rounded),
      ),
    );
  }
}
