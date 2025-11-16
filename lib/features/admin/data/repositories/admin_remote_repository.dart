import 'package:fpdart/fpdart.dart';

import '../../../../core/enums/reservation_status.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/errors/server_exception.dart';
import '../../domain/entities/admin_reservation_entity.dart';
import '../../domain/repositories/admin_repository.dart';
import '../datasources/admin_data_source.dart';

final class AdminRemoteRepository implements AdminRepository {
  final AdminDataSource _adminDataSource;

  const AdminRemoteRepository(AdminDataSource adminDataSource)
    : _adminDataSource = adminDataSource;

  @override
  Future<Either<Failure, List<AdminReservationEntity>>> loadAllReservations(
    ReservationStatus status,
  ) async {
    try {
      final res = await _adminDataSource.loadAllReservations(status);
      return right(res);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, Unit>> updateReservationStatus({
    required int reservationId,
    required ReservationStatus status,
    String? rejectionReason,
    int? finalPrice,
  }) async {
    try {
      final unit = await _adminDataSource.updateReservationStatus(
        reservationId: reservationId,
        status: status,
        rejectionReason: rejectionReason,
        finalPrice: finalPrice,
      );

      return right(unit);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }
}
