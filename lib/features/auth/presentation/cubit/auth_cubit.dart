import 'package:flutter/foundation.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/cubits/app_user/app_user_cubit.dart';
import '../../../../core/entities/user_entity.dart';
import '../../domain/usecases/log_out.dart';
import '../../domain/usecases/send_otp.dart';
import '../../domain/usecases/verify_otp.dart';
import '../../domain/usecases/verify_token.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AppUserCubit _appUserCubit;

  final SendOtp _sendOtp;
  final VerifyOtp _verifyOtp;
  final VerifyToken _verifyToken;
  final LogOut _logOut;

  AuthCubit({
    required SendOtp sendOtp,
    required VerifyOtp verifyOtp,
    required AppUserCubit appUserCubit,
    required VerifyToken verifyToken,
    required LogOut logOut,
  }) : _appUserCubit = appUserCubit,
       _sendOtp = sendOtp,
       _verifyOtp = verifyOtp,
       _verifyToken = verifyToken,
       _logOut = logOut,
       super(AuthInitial()) {
    _appUserCubit.logOut = __logOut;
  }

  Future<void> sendOtp({required String name, required String email}) async {
    if (state is AuthLoading) return;

    emit(AuthLoading());

    final params = SendOtpParams(name: name, email: email);
    final res = await _sendOtp(params);
    res.fold(
      (failure) {
        emit(AuthFailure(failure.message));
      },
      (_) {
        emit(AuthOTPSent(name: name, email: email));
      },
    );
  }

  Future<void> verifyOtp({
    required String otp,
    required String email,
    required String name,
  }) async {
    if (state is AuthLoading) return;

    emit(AuthLoading());

    final params = VerifyOtpParams(otp: otp, email: email, name: name);
    final res = await _verifyOtp(params);
    res.fold(
      (failure) {
        emit(AuthFailure(failure.message));
      },
      (user) {
        _appUserCubit.updateUser(user);
        emit(AuthSuccess(user));
      },
    );
  }

  Future<void> verifyToken() async {
    if (state is AuthLoading) return;

    emit(AuthLoading());

    final params = VerifyTokenParams();
    final res = await _verifyToken(params);
    res.fold(
      (failure) {
        emit(AuthFailure(failure.message));
      },
      (user) {
        _appUserCubit.updateUser(user);
        emit(AuthSuccess(user));
      },
    );
  }

  Future<void> __logOut() async {
    final params = LogOutParams();
    final res = await _logOut(params);
    res.fold(
      (_) {
        //
      },
      (_) {
        _appUserCubit.emitUserInitial();
        emit(AuthInitial());
      },
    );
  }
}
