import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/app_router.dart';
import '../../../../../core/widgets/loader.dart';
import '../../cubit/auth_cubit.dart';

class SplashLoader extends StatelessWidget {
  const SplashLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) async {
        if (state is AuthSuccess) {
          await Navigator.pushReplacementNamed(context, AppRouter.homePage);
        } else if (state is AuthFailure) {
          await Navigator.pushReplacementNamed(context, AppRouter.loginPage);
        }
      },
      child: const Center(child: Loader()),
    );
  }
}
