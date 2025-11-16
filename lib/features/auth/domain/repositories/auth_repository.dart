import 'package:fpdart/fpdart.dart';

import '../../../../core/entities/user_entity.dart';
import '../../../../core/errors/failure.dart';

abstract interface class AuthRepository {
  Future<Either<Failure, Unit>> sendOtp({
    required String name,
    required String email,
  });

  Future<Either<Failure, UserEntity>> verifyOtp({
    required String otp,
    required String email,
    required String name,
  });

  Future<Either<Failure, UserEntity>> verifyToken();

  Future<Either<Failure, Unit>> logOut();
}
