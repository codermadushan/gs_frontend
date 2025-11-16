import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/app_color.dart';
import '../../../../core/constants/app_size.dart';
import '../../../../core/constants/app_style.dart';
import '../cubit/auth_cubit.dart';
import '../models/user_data.dart';
import '../widgets/otp_verification_page/otp_verification_app_bar.dart';
import '../widgets/otp_verification_page/otp_verification_button.dart';
import '../widgets/otp_verification_page/pin_input_field.dart';

class OtpVerificationPage extends StatefulWidget {
  const OtpVerificationPage({super.key});

  @override
  State<OtpVerificationPage> createState() => _OtpVerificationPageState();
}

class _OtpVerificationPageState extends State<OtpVerificationPage> {
  late final UserData _userData;

  late final AuthCubit _authCubit;

  final _otpController = TextEditingController();

  @override
  void initState() {
    super.initState();

    _authCubit = context.read<AuthCubit>();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _userData = ModalRoute.settingsOf(context)!.arguments as UserData;
  }

  @override
  void dispose() {
    _otpController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const OtpVerificationAppBar(),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppSize.pagePadding),
        child: Center(
          child: SingleChildScrollView(
            physics: const ScrollPhysics(),
            reverse: true,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: AppSize.gapLarge),

                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: 'We sent you a 6 digit verification code to ',
                    style: AppStyle.h5.copyWith(color: AppColor.foreground),
                    children: [
                      TextSpan(
                        text: _userData.email,
                        style: const TextStyle(color: AppColor.primary),
                      ),

                      const TextSpan(text: ', enter it below'),
                    ],
                  ),
                ),

                const SizedBox(height: AppSize.gapLarge),

                PinInputField(controller: _otpController, length: 6),

                const SizedBox(height: AppSize.gapMedium),

                OtpVerificationButton(
                  onPressed: () {
                    _authCubit.verifyOtp(
                      otp: _otpController.text.trim(),
                      email: _userData.email,
                      name: _userData.name,
                    );
                  },
                ),

                const SizedBox(height: AppSize.gapLarge),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
