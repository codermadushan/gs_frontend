import 'package:flutter/foundation.dart';

import 'package:fpdart/fpdart.dart';

import '../../../../core/entities/user_reservation_entity.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/usecases/async_use_case.dart';
import '../repositories/reservations_repository.dart';

@immutable
final class LoadUserReservationsParams {}

final class LoadUserReservations
    implements
        AsyncUseCase<List<UserReservationEntity>, LoadUserReservationsParams> {
  final ReservationsRepository _reservationsRepository;

  const LoadUserReservations(ReservationsRepository reservationsRepository)
    : _reservationsRepository = reservationsRepository;

  @override
  Future<Either<Failure, List<UserReservationEntity>>> call(
    LoadUserReservationsParams params,
  ) async {
    return await _reservationsRepository.loadUserReservations();
  }
}
