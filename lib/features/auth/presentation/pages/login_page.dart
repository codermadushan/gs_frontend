import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/input_field.dart';
import '../../../../core/constants/app_media.dart';
import '../../../../core/constants/app_size.dart';
import '../../../../core/constants/app_style.dart';
import '../cubit/auth_cubit.dart';
import '../utils/validators/is_valid_email.dart';
import '../utils/validators/is_valid_name.dart';
import '../widgets/login_page/login_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late final AuthCubit _authCubit;

  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();

  @override
  void initState() {
    super.initState();

    _authCubit = context.read<AuthCubit>();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Registration', style: AppStyle.h2),
        centerTitle: true,
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppSize.pagePadding),
        child: Form(
          key: _formKey,
          child: Center(
            child: SingleChildScrollView(
              physics: const ScrollPhysics(),
              reverse: true,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: AppSize.gapLarge),

                  Image.asset(
                    AppMedia.logoImage,
                    width: width / 2,
                    height: width / 2,
                    fit: BoxFit.cover,
                  ),

                  const SizedBox(height: AppSize.gapLarge),

                  InputField(
                    controller: _nameController,
                    validator: isValidName,
                    hintText: 'Enter your name',
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.name,
                  ),

                  const SizedBox(height: AppSize.gapSmall),

                  InputField(
                    controller: _emailController,
                    validator: isValidEmail,
                    hintText: 'Enter your email',
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.emailAddress,
                  ),

                  const SizedBox(height: AppSize.gapMedium),

                  LoginButton(
                    onPressed: () {
                      final isValid = _formKey.currentState!.validate();

                      if (isValid) {
                        _authCubit.sendOtp(
                          name: _nameController.text.trim(),
                          email: _emailController.text.trim(),
                        );
                      }
                    },
                  ),

                  const SizedBox(height: AppSize.gapLarge),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
