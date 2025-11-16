import 'package:flutter/foundation.dart';

import 'package:fpdart/fpdart.dart';

import '../../../../core/entities/user_entity.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/usecases/async_use_case.dart';
import '../repositories/auth_repository.dart';

@immutable
final class VerifyTokenParams {}

final class VerifyToken implements AsyncUseCase<UserEntity, VerifyTokenParams> {
  final AuthRepository _authRepository;

  const VerifyToken(AuthRepository authRepository)
    : _authRepository = authRepository;

  @override
  Future<Either<Failure, UserEntity>> call(VerifyTokenParams params) async {
    return await _authRepository.verifyToken();
  }
}
