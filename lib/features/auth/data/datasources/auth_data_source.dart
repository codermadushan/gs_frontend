import 'package:fpdart/fpdart.dart';

import '../models/user_model.dart';

abstract interface class AuthDataSource {
  Future<void> sendOtp({required String name, required String email});

  Future<UserModel> verifyOtp({
    required String otp,
    required String email,
    required String name,
  });

  Future<UserModel> verifyToken();

  Future<Unit> logOut();
}
