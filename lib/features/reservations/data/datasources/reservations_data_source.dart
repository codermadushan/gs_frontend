import 'package:fpdart/fpdart.dart';

import '../models/time_slot_model.dart';
import '../models/user_reservation_model.dart';

abstract interface class ReservationsDataSource {
  Future<List<TimeSlotModel>> loadAvailableTimeSlots({
    required List<int> serviceIds,
    required String isoDateString,
  });

  Future<Unit> createReservation({
    required List<int> optionIds,
    required String additionalInfo,
    required int barberId,
    required String date,
    required String startAt,
    required String endAt,
  });

  Future<List<UserReservationModel>> loadUserReservations();

  Future<Unit> deleteReservation(int reservationId);
}
