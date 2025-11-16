import 'package:fpdart/fpdart.dart';

import '../../../../core/entities/user_reservation_entity.dart';
import '../../../../core/errors/failure.dart';
import '../entities/time_slot_entity.dart';

abstract interface class ReservationsRepository {
  Future<Either<Failure, List<TimeSlotEntity>>> loadAvailableTimeSlots({
    required List<int> serviceIds,
    required String isoDateString,
  });

  Future<Either<Failure, Unit>> createReservation({
    required List<int> optionIds,
    required String additionalInfo,
    required int barberId,
    required String date,
    required String startAt,
    required String endAt,
  });

  Future<Either<Failure, List<UserReservationEntity>>> loadUserReservations();

  Future<Either<Failure, Unit>> deleteReservation(int reservationId);
}
