import 'dart:convert';

import 'package:fpdart/fpdart.dart';
import 'package:http/http.dart';

import '../../../../core/constants/app_string.dart';
import '../../../../core/errors/server_exception.dart';
import '../../../../core/storage/app_secure_storage.dart';
import '../models/status_message_model.dart';
import 'status_message_data_source.dart';

final class StatusMessageRemoteDataSource implements StatusMessageDataSource {
  static const _baseUrl = String.fromEnvironment(AppString.baseUrl);

  final AppSecureStorage _appSecureStorage;

  const StatusMessageRemoteDataSource(AppSecureStorage appSecureStorage)
    : _appSecureStorage = appSecureStorage;

  @override
  Future<StatusMessageModel> getStatusMessage() async {
    try {
      final token = await _appSecureStorage.read(AppString.tokenName);

      if (token == null) {
        throw const ServerException('Authentication token is missing.');
      }

      final res = await get(
        Uri.parse('$_baseUrl/api/v1/status-message'),
        headers: {'Authorization': 'Bearer $token'},
      );

      if (res.statusCode != 200) {
        throw const ServerException('Failed to load status message');
      }

      final resBody = jsonDecode(res.body);

      return StatusMessageModel.fromMap({
        'msg': resBody['msg'],
        'color': resBody['color'],
      });
    } on ServerException catch (e) {
      throw ServerException(e.message);
    } catch (e) {
      throw const ServerException(AppString.defaultErrorMessage);
    }
  }

  @override
  Future<Unit> updateStatusMessage({
    required String message,
    required String color,
  }) {
    throw UnimplementedError();
  }
}
