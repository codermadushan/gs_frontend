import 'package:flutter/foundation.dart';

import 'package:fpdart/fpdart.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/usecases/async_use_case.dart';
import '../repositories/auth_repository.dart';

@immutable
final class SendOtpParams {
  final String name;
  final String email;

  const SendOtpParams({required this.name, required this.email});
}

final class SendOtp implements AsyncUseCase<Unit, SendOtpParams> {
  final AuthRepository _authRepository;

  const SendOtp(AuthRepository authRepository)
    : _authRepository = authRepository;

  @override
  Future<Either<Failure, Unit>> call(SendOtpParams params) async {
    return await _authRepository.sendOtp(
      name: params.name,
      email: params.email,
    );
  }
}
