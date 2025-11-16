import 'dart:convert';

import 'package:http/http.dart';

import '../../../../core/constants/app_string.dart';
import '../../../../core/errors/server_exception.dart';
import '../../../../core/storage/app_secure_storage.dart';
import '../models/image_model.dart';
import 'slideshow_data_source.dart';

final class SlideshowRemoteDataSource implements SlideshowDataSource {
  static const _baseUrl = String.fromEnvironment(AppString.baseUrl);

  final AppSecureStorage _appSecureStorage;

  const SlideshowRemoteDataSource(AppSecureStorage appSecureStorage)
    : _appSecureStorage = appSecureStorage;

  @override
  Future<List<ImageModel>> loadImages() async {
    try {
      final token = await _appSecureStorage.read(AppString.tokenName);

      if (token == null) {
        throw const ServerException('Authentication token is missing.');
      }

      final res = await get(
        Uri.parse('$_baseUrl/api/v1/slideshow'),
        headers: {'Authorization': 'Bearer $token'},
      );

      if (res.statusCode != 200) {
        throw const ServerException('Failed to load images');
      }

      final resBody = jsonDecode(res.body);

      return (resBody['images'] as List<dynamic>).map((image) {
        return ImageModel.fromMap(image);
      }).toList();
    } on ServerException catch (e) {
      throw ServerException(e.message);
    } catch (e) {
      throw const ServerException(AppString.defaultErrorMessage);
    }
  }
}
