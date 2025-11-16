import 'package:flutter/foundation.dart';

import 'package:fpdart/fpdart.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/usecases/async_use_case.dart';
import '../repositories/reservations_repository.dart';

@immutable
final class DeleteReservationParams {
  final int reservationId;

  const DeleteReservationParams(this.reservationId);
}

final class DeleteReservation
    implements AsyncUseCase<Unit, DeleteReservationParams> {
  final ReservationsRepository _reservationsRepository;

  const DeleteReservation(ReservationsRepository reservationsRepository)
    : _reservationsRepository = reservationsRepository;

  @override
  Future<Either<Failure, Unit>> call(DeleteReservationParams params) async {
    return await _reservationsRepository.deleteReservation(
      params.reservationId,
    );
  }
}
