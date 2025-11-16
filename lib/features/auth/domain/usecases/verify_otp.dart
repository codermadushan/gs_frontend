import 'package:flutter/foundation.dart';

import 'package:fpdart/fpdart.dart';

import '../../../../core/entities/user_entity.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/usecases/async_use_case.dart';
import '../repositories/auth_repository.dart';

@immutable
final class VerifyOtpParams {
  final String otp;
  final String email;
  final String name;

  const VerifyOtpParams({
    required this.otp,
    required this.email,
    required this.name,
  });
}

final class VerifyOtp implements AsyncUseCase<UserEntity, VerifyOtpParams> {
  final AuthRepository _authRepository;

  const VerifyOtp(AuthRepository authRepository)
    : _authRepository = authRepository;

  @override
  Future<Either<Failure, UserEntity>> call(VerifyOtpParams params) async {
    return await _authRepository.verifyOtp(
      otp: params.otp,
      email: params.email,
      name: params.name,
    );
  }
}
