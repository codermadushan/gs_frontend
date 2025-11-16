import 'package:fpdart/fpdart.dart';

import '../../../../core/entities/user_reservation_entity.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/errors/server_exception.dart';
import '../../domain/entities/time_slot_entity.dart';
import '../../domain/repositories/reservations_repository.dart';
import '../datasources/reservations_data_source.dart';

final class ReservationsRemoteRepository implements ReservationsRepository {
  final ReservationsDataSource _reservationsDataSource;

  const ReservationsRemoteRepository(
    ReservationsDataSource reservationsDataSource,
  ) : _reservationsDataSource = reservationsDataSource;

  @override
  Future<Either<Failure, List<TimeSlotEntity>>> loadAvailableTimeSlots({
    required List<int> serviceIds,
    required String isoDateString,
  }) async {
    try {
      final timeSlotModels = await _reservationsDataSource
          .loadAvailableTimeSlots(
            serviceIds: serviceIds,
            isoDateString: isoDateString,
          );

      return right(timeSlotModels);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, Unit>> createReservation({
    required List<int> optionIds,
    required String additionalInfo,
    required int barberId,
    required String date,
    required String startAt,
    required String endAt,
  }) async {
    try {
      final unit = await _reservationsDataSource.createReservation(
        optionIds: optionIds,
        additionalInfo: additionalInfo,
        barberId: barberId,
        date: date,
        startAt: startAt,
        endAt: endAt,
      );

      return right(unit);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, List<UserReservationEntity>>>
  loadUserReservations() async {
    try {
      final res = await _reservationsDataSource.loadUserReservations();

      return right(res);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, Unit>> deleteReservation(int reservationId) async {
    try {
      final unit = await _reservationsDataSource.deleteReservation(
        reservationId,
      );

      return right(unit);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }
}
