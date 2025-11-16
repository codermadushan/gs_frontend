import 'package:fpdart/fpdart.dart';

import '../../../../core/enums/reservation_status.dart';
import '../../../../core/errors/failure.dart';
import '../entities/admin_reservation_entity.dart';

abstract interface class AdminRepository {
  Future<Either<Failure, List<AdminReservationEntity>>> loadAllReservations(
    ReservationStatus status,
  );

  Future<Either<Failure, Unit>> updateReservationStatus({
    required int reservationId,
    required ReservationStatus status,
    String? rejectionReason,
    int? finalPrice,
  });
}
