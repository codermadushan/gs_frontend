import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../core/app_router.dart';
import '../../../../../core/widgets/app_snack_bar.dart';
import '../../../../../core/widgets/main_button.dart';
import '../../cubit/auth_cubit.dart';

class OtpVerificationButton extends StatelessWidget {
  final VoidCallback _onPressed;

  const OtpVerificationButton({super.key, required VoidCallback onPressed})
    : _onPressed = onPressed;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) async {
        if (state is AuthSuccess) {
          await Navigator.pushNamedAndRemoveUntil(
            context,
            AppRouter.homePage,
            (route) => false,
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
          label: 'Verify',
          onPressed: _onPressed,
          icon: FontAwesomeIcons.unlock,
          isLoading: isLoading,
        );
      },
    );
  }
}
