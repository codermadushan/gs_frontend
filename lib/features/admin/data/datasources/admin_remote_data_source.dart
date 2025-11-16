import 'dart:convert';

import 'package:fpdart/fpdart.dart';
import 'package:http/http.dart';

import '../../../../core/constants/app_string.dart';
import '../../../../core/enums/reservation_status.dart';
import '../../../../core/errors/server_exception.dart';
import '../../../../core/storage/app_secure_storage.dart';
import '../models/admin_reservation_model.dart';
import 'admin_data_source.dart';

final class AdminRemoteDataSource implements AdminDataSource {
  static const _baseUrl = String.fromEnvironment(AppString.baseUrl);

  final AppSecureStorage _appSecureStorage;

  const AdminRemoteDataSource(AppSecureStorage appSecureStorage)
    : _appSecureStorage = appSecureStorage;

  @override
  Future<List<AdminReservationModel>> loadAllReservations(
    ReservationStatus status,
  ) async {
    try {
      final token = await _appSecureStorage.read(AppString.tokenName);

      if (token == null) {
        throw const ServerException('Authentication token is missing.');
      }

      final res = await get(
        Uri.parse('$_baseUrl/api/v1/admin/reservations?status=${status.name}'),
        headers: {'Authorization': 'Bearer $token'},
      );

      if (res.statusCode != 200) {
        throw const ServerException('Failed to load reservations');
      }

      final resBody = jsonDecode(res.body);

      return (resBody['reservations'] as List<dynamic>).map((reservation) {
        return AdminReservationModel.fromMap(reservation);
      }).toList();
    } on ServerException catch (e) {
      throw ServerException(e.message);
    } catch (e) {
      throw const ServerException(AppString.defaultErrorMessage);
    }
  }

  @override
  Future<Unit> updateReservationStatus({
    required int reservationId,
    required ReservationStatus status,
    String? rejectionReason,
    int? finalPrice,
  }) async {
    try {
      final token = await _appSecureStorage.read(AppString.tokenName);

      if (token == null) {
        throw const ServerException('Authentication token is missing.');
      }

      final res = await patch(
        Uri.parse('$_baseUrl/api/v1/admin/reservations/$reservationId'),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'status': status.name,
          'rejectionReason': rejectionReason ?? '',
          'finalPrice': finalPrice ?? 0,
        }),
      );

      if (res.statusCode != 200) {
        throw const ServerException('Failed update reservation status');
      }

      return unit;
    } on ServerException catch (e) {
      throw ServerException(e.message);
    } catch (e) {
      throw const ServerException(AppString.defaultErrorMessage);
    }
  }
}
