import 'package:flutter/foundation.dart';

import 'package:fpdart/fpdart.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/usecases/async_use_case.dart';
import '../entities/time_slot_entity.dart';
import '../repositories/reservations_repository.dart';

@immutable
final class LoadAvailableTimeSlotsParams {
  final String isoDateString;
  final List<int> serviceIds;

  const LoadAvailableTimeSlotsParams({
    required this.isoDateString,
    required this.serviceIds,
  });
}

final class LoadAvailableTimeSlots
    implements
        AsyncUseCase<List<TimeSlotEntity>, LoadAvailableTimeSlotsParams> {
  final ReservationsRepository _reservationsRepository;

  const LoadAvailableTimeSlots(ReservationsRepository reservationsRepository)
    : _reservationsRepository = reservationsRepository;

  @override
  Future<Either<Failure, List<TimeSlotEntity>>> call(
    LoadAvailableTimeSlotsParams params,
  ) async {
    return await _reservationsRepository.loadAvailableTimeSlots(
      serviceIds: params.serviceIds,
      isoDateString: params.isoDateString,
    );
  }
}
