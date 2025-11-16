import 'dart:convert';

import 'package:fpdart/fpdart.dart';
import 'package:http/http.dart';

import '../../../../core/errors/server_exception.dart';
import '../../../../core/constants/app_string.dart';
import '../../../../core/storage/app_secure_storage.dart';
import '../models/user_model.dart';
import 'auth_data_source.dart';

final class AuthRemoteDataSource implements AuthDataSource {
  static const _baseUrl = String.fromEnvironment(AppString.baseUrl);

  final AppSecureStorage _appSecureStorage;

  const AuthRemoteDataSource(AppSecureStorage appSecureStorage)
    : _appSecureStorage = appSecureStorage;

  @override
  Future<void> sendOtp({required String name, required String email}) async {
    try {
      final res = await post(
        Uri.parse('$_baseUrl/api/v1/auth/send-otp'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'name': name, 'email': email}),
      );

      if (res.statusCode != 200) {
        throw const ServerException('Unable to send OTP. Please try again.');
      }
    } on ServerException catch (e) {
      throw ServerException(e.message);
    } catch (e) {
      throw const ServerException(AppString.defaultErrorMessage);
    }
  }

  @override
  Future<UserModel> verifyOtp({
    required String name,
    required String email,
    required String otp,
  }) async {
    try {
      final res = await post(
        Uri.parse('$_baseUrl/api/v1/auth/verify-otp'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'name': name, 'email': email, 'otp': otp}),
      );

      final resBody = jsonDecode(res.body);

      if (res.statusCode != 200) {
        throw ServerException(resBody['message'] as String);
      }

      final token = resBody['token'];
      await _appSecureStorage.write(key: AppString.tokenName, value: token);

      final user = resBody['user'];
      return UserModel.fromMap(user);
    } on ServerException catch (e) {
      throw ServerException(e.message);
    } catch (e) {
      throw const ServerException(AppString.defaultErrorMessage);
    }
  }

  @override
  Future<UserModel> verifyToken() async {
    try {
      final token = await _appSecureStorage.read(AppString.tokenName);

      if (token == null) {
        throw const ServerException('Authentication token is missing.');
      }

      final res = await get(
        Uri.parse('$_baseUrl/api/v1/auth/verify-token'),
        headers: {'Authorization': 'Bearer $token'},
      );

      if (res.statusCode != 200) {
        await _appSecureStorage.delete(AppString.tokenName);
        throw const ServerException('Authentication token is invalid');
      }

      final resBody = jsonDecode(res.body);
      final user = resBody['user'];
      return UserModel.fromMap(user);
    } on ServerException catch (e) {
      throw ServerException(e.message);
    } catch (e) {
      throw const ServerException(AppString.defaultErrorMessage);
    }
  }

  @override
  Future<Unit> logOut() async {
    try {
      await _appSecureStorage.delete(AppString.tokenName);
      return unit;
    } catch (e) {
      throw const ServerException('Logout failed. Please try again');
    }
  }
}
