import 'package:flutter/foundation.dart';

import 'package:fpdart/fpdart.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/usecases/async_use_case.dart';
import '../repositories/auth_repository.dart';

@immutable
final class LogOutParams {}

final class LogOut implements AsyncUseCase<Unit, LogOutParams> {
  final AuthRepository _authRepository;

  const LogOut(AuthRepository authRepository)
    : _authRepository = authRepository;

  @override
  Future<Either<Failure, Unit>> call(LogOutParams params) async {
    return await _authRepository.logOut();
  }
}
