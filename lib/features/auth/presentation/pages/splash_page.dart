import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/auth_cubit.dart';
import '../widgets/splash_page/splash_loader.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  late final AuthCubit _authCubit;

  @override
  void initState() {
    super.initState();

    _authCubit = context.read<AuthCubit>();
    _authCubit.verifyToken();
  }

  @override
  Widget build(BuildContext context) {
    return const SplashLoader();
  }
}
