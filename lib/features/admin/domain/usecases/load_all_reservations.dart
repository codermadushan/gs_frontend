import 'package:flutter/foundation.dart';

import 'package:fpdart/fpdart.dart';

import '../../../../core/enums/reservation_status.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/usecases/async_use_case.dart';
import '../entities/admin_reservation_entity.dart';
import '../repositories/admin_repository.dart';

@immutable
final class LoadAllReservationsParams {
  final ReservationStatus status;

  const LoadAllReservationsParams(this.status);
}

final class LoadAllReservations
    implements
        AsyncUseCase<List<AdminReservationEntity>, LoadAllReservationsParams> {
  final AdminRepository _adminRepository;

  const LoadAllReservations(AdminRepository adminRepository)
    : _adminRepository = adminRepository;

  @override
  Future<Either<Failure, List<AdminReservationEntity>>> call(
    LoadAllReservationsParams params,
  ) async {
    return _adminRepository.loadAllReservations(params.status);
  }
}
