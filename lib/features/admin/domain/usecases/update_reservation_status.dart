import 'package:flutter/foundation.dart';

import 'package:fpdart/fpdart.dart';

import '../../../../core/enums/reservation_status.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/usecases/async_use_case.dart';
import '../repositories/admin_repository.dart';

@immutable
final class UpdateReservationStatusParams {
  final int reservationId;
  final ReservationStatus status;
  final String? rejectionReason;
  final int? finalPrice;

  const UpdateReservationStatusParams({
    required this.reservationId,
    required this.status,
    this.rejectionReason,
    this.finalPrice,
  });
}

final class UpdateReservationStatus
    implements AsyncUseCase<Unit, UpdateReservationStatusParams> {
  final AdminRepository _adminRepository;

  const UpdateReservationStatus(AdminRepository adminRepository)
    : _adminRepository = adminRepository;

  @override
  Future<Either<Failure, Unit>> call(
    UpdateReservationStatusParams params,
  ) async {
    return await _adminRepository.updateReservationStatus(
      reservationId: params.reservationId,
      status: params.status,
      rejectionReason: params.rejectionReason,
      finalPrice: params.finalPrice,
    );
  }
}
