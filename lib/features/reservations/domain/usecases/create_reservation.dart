import 'package:flutter/foundation.dart';

import 'package:fpdart/fpdart.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/usecases/async_use_case.dart';
import '../repositories/reservations_repository.dart';

@immutable
final class CreateReservationParams {
  final List<int> optionIds;
  final String additionalInfo;
  final int barberId;
  final String date;
  final String startAt;
  final String endAt;

  const CreateReservationParams({
    required this.optionIds,
    required this.additionalInfo,
    required this.barberId,
    required this.date,
    required this.startAt,
    required this.endAt,
  });
}

final class CreateReservation
    implements AsyncUseCase<Unit, CreateReservationParams> {
  final ReservationsRepository _reservationsRepository;

  const CreateReservation(ReservationsRepository reservationsRepository)
    : _reservationsRepository = reservationsRepository;

  @override
  Future<Either<Failure, Unit>> call(CreateReservationParams params) async {
    return await _reservationsRepository.createReservation(
      optionIds: params.optionIds,
      additionalInfo: params.additionalInfo,
      barberId: params.barberId,
      date: params.date,
      startAt: params.startAt,
      endAt: params.endAt,
    );
  }
}
