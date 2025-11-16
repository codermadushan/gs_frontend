import 'package:fpdart/fpdart.dart';

import '../../../../core/entities/user_entity.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/errors/server_exception.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_data_source.dart';
import '../utils/validators/is_valid_otp.dart';

final class AuthRemoteRepository implements AuthRepository {
  final AuthDataSource _authDataSource;

  const AuthRemoteRepository(AuthDataSource authDataSource)
    : _authDataSource = authDataSource;

  @override
  Future<Either<Failure, Unit>> sendOtp({
    required String name,
    required String email,
  }) async {
    try {
      await _authDataSource.sendOtp(name: name, email: email);
      return right(unit);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> verifyOtp({
    required String otp,
    required String email,
    required String name,
  }) async {
    try {
      if (!isValidOTP(otp)) {
        return left(const Failure('OTP is invalid'));
      }

      final userModel = await _authDataSource.verifyOtp(
        otp: otp,
        email: email,
        name: name,
      );
      return right(userModel);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> verifyToken() async {
    try {
      final userModel = await _authDataSource.verifyToken();
      return right(userModel);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, Unit>> logOut() async {
    try {
      final unit = await _authDataSource.logOut();
      return right(unit);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }
}
