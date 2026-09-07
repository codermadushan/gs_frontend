import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/app_router.dart';
import '../../../../../core/widgets/app_snack_bar.dart';
import '../../../../../core/widgets/main_button.dart';
import '../../cubit/auth_cubit.dart';
import '../../models/user_data.dart';

class LoginButton extends StatelessWidget {
  final VoidCallback _onPressed;

  const LoginButton({super.key, required VoidCallback onPressed})
    : _onPressed = onPressed;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthOTPSent) {
          final userData = UserData(name: state.name, email: state.email);

          Navigator.pushNamed(
            context,
            AppRouter.otpVerificationPage,
            arguments: userData,
          );
        } else if (state is AuthFailure) {
          AppSnackBar.error(context: context, message: state.message);
        }
      },
      buildWhen: (previous, current) {
        if (previous is AuthLoading || current is AuthLoading) {
          return true;
        }

        return false;
      },
      builder: (context, state) {
        final isLoading = state is AuthLoading;

        return MainButton(
          label: 'Register',
          onPressed: _onPressed,
          // icon: FontAwesomeIcons.solidUser,
          icon: Icons.person_add_rounded,
          isLoading: isLoading,
        );
      },
    );
  }
}
