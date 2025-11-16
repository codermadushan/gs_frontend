import 'dart:convert';

import 'package:http/http.dart';

import '../../../../core/constants/app_string.dart';
import '../../../../core/errors/server_exception.dart';
import '../../../../core/storage/app_secure_storage.dart';
import '../models/barber_model.dart';
import '../models/service_category_model.dart';
import 'barbers_data_source.dart';

final class BarbersRemoteDataSource implements BarbersDataSource {
  static const _baseUrl = String.fromEnvironment(AppString.baseUrl);

  final AppSecureStorage _appSecureStorage;

  const BarbersRemoteDataSource(AppSecureStorage appSecureStorage)
    : _appSecureStorage = appSecureStorage;

  @override
  Future<List<BarberModel>> loadBarbers() async {
    try {
      final token = await _appSecureStorage.read(AppString.tokenName);

      if (token == null) {
        throw const ServerException('Authentication token is missing.');
      }

      final res = await get(
        Uri.parse('$_baseUrl/api/v1/barbers'),
        headers: {'Authorization': 'Bearer $token'},
      );

      if (res.statusCode != 200) {
        throw const ServerException('Failed to load barbers');
      }

      final resBody = jsonDecode(res.body);

      return (resBody['barbers'] as List<dynamic>).map((barber) {
        return BarberModel.fromMap(barber);
      }).toList();
    } on ServerException catch (e) {
      throw ServerException(e.message);
    } catch (e) {
      throw const ServerException(AppString.defaultErrorMessage);
    }
  }

  @override
  Future<List<ServiceCategoryModel>> loadBarberServices(int barberId) async {
    try {
      final token = await _appSecureStorage.read(AppString.tokenName);

      if (token == null) {
        throw const ServerException('Authentication token is missing.');
      }

      final res = await get(
        Uri.parse('$_baseUrl/api/v1/barbers/$barberId/services'),
        headers: {'Authorization': 'Bearer $token'},
      );

      if (res.statusCode != 200) {
        throw const ServerException('Failed to load services of the barber');
      }

      final resBody = jsonDecode(res.body);

      return (resBody['barberServices'] as List<dynamic>).map((category) {
        return ServiceCategoryModel.fromMap(category);
      }).toList();
    } on ServerException catch (e) {
      throw ServerException(e.message);
    } catch (e) {
      throw const ServerException(AppString.defaultErrorMessage);
    }
  }
}
