import 'dart:convert';

import 'package:fpdart/fpdart.dart';
import 'package:http/http.dart';

import '../../../../core/constants/app_string.dart';
import '../../../../core/errors/server_exception.dart';
import '../../../../core/storage/app_secure_storage.dart';
import '../models/time_slot_model.dart';
import '../models/user_reservation_model.dart';
import 'reservations_data_source.dart';

final class ReservationsRemoteDataSource implements ReservationsDataSource {
  static const _baseUrl = String.fromEnvironment(AppString.baseUrl);

  final AppSecureStorage _appSecureStorage;

  const ReservationsRemoteDataSource(AppSecureStorage appSecureStorage)
    : _appSecureStorage = appSecureStorage;

  @override
  Future<List<TimeSlotModel>> loadAvailableTimeSlots({
    required List<int> serviceIds,
    required String isoDateString,
  }) async {
    try {
      final token = await _appSecureStorage.read(AppString.tokenName);

      if (token == null) {
        throw const ServerException('Authentication token is missing.');
      }

      final res = await post(
        Uri.parse('$_baseUrl/api/v1/reservations/availability'),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
        body: jsonEncode({'serviceIds': serviceIds, 'date': isoDateString}),
      );

      if (res.statusCode != 200) {
        throw const ServerException('Failed to load available time slots');
      }

      final resBody = jsonDecode(res.body);

      return (resBody['slots'] as List<dynamic>).map((slot) {
        return TimeSlotModel.fromMap(slot);
      }).toList();
    } on ServerException catch (e) {
      throw ServerException(e.message);
    } catch (e) {
      throw const ServerException(AppString.defaultErrorMessage);
    }
  }

  @override
  Future<Unit> createReservation({
    required List<int> optionIds,
    required String additionalInfo,
    required int barberId,
    required String date,
    required String startAt,
    required String endAt,
  }) async {
    try {
      final token = await _appSecureStorage.read(AppString.tokenName);

      if (token == null) {
        throw const ServerException('Authentication token is missing.');
      }

      final res = await post(
        Uri.parse('$_baseUrl/api/v1/reservations'),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'optionIds': optionIds,
          'additionalInfo': additionalInfo,
          'barberId': barberId,
          'date': date,
          'startAt': startAt,
          'endAt': endAt,
        }),
      );

      final resBody = jsonDecode(res.body);

      if (res.statusCode != 201) {
        throw ServerException(resBody['message']);
      }

      return unit;
    } on ServerException catch (e) {
      throw ServerException(e.message);
    } catch (e) {
      throw const ServerException(AppString.defaultErrorMessage);
    }
  }

  @override
  Future<List<UserReservationModel>> loadUserReservations() async {
    try {
      final token = await _appSecureStorage.read(AppString.tokenName);

      if (token == null) {
        throw const ServerException('Authentication token is missing.');
      }

      final res = await get(
        Uri.parse('$_baseUrl/api/v1/reservations/user'),
        headers: {'Authorization': 'Bearer $token'},
      );

      if (res.statusCode != 200) {
        throw const ServerException('Failed to load reservations');
      }

      final resBody = jsonDecode(res.body);

      return (resBody['reservations'] as List<dynamic>).map((reservation) {
        return UserReservationModel.fromMap(reservation);
      }).toList();
    } on ServerException catch (e) {
      throw ServerException(e.message);
    } catch (e) {
      throw const ServerException(AppString.defaultErrorMessage);
    }
  }

  @override
  Future<Unit> deleteReservation(int reservationId) async {
    try {
      final token = await _appSecureStorage.read(AppString.tokenName);

      if (token == null) {
        throw const ServerException('Authentication token is missing.');
      }

      final res = await delete(
        Uri.parse('$_baseUrl/api/v1/reservations/$reservationId'),
        headers: {'Authorization': 'Bearer $token'},
      );

      if (res.statusCode != 200) {
        throw const ServerException('Failed to delete reservation');
      }

      return unit;
    } on ServerException catch (e) {
      throw ServerException(e.message);
    } catch (e) {
      throw const ServerException(AppString.defaultErrorMessage);
    }
  }
}
