import 'package:fpdart/fpdart.dart';

import '../../../../core/enums/reservation_status.dart';
import '../models/admin_reservation_model.dart';

abstract interface class AdminDataSource {
  Future<List<AdminReservationModel>> loadAllReservations(
    ReservationStatus status,
  );

  Future<Unit> updateReservationStatus({
    required int reservationId,
    required ReservationStatus status,
    String? rejectionReason,
    int? finalPrice,
  });
}
