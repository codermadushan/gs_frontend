import 'package:flutter/foundation.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/time_slot_entity.dart';
import '../../../domain/usecases/load_available_time_slots.dart';

part 'available_time_slots_state.dart';

class AvailableTimeSlotsCubit extends Cubit<AvailableTimeSlotsState> {
  final LoadAvailableTimeSlots _loadAvailableTimeSlots;

  AvailableTimeSlotsCubit(LoadAvailableTimeSlots loadAvailableTimeSlots)
    : _loadAvailableTimeSlots = loadAvailableTimeSlots,
      super(AvailableTimeSlotsInitial());

  Future<void> loadAvailableTimeSlots({
    required List<int> serviceIds,
    required String isoDateString,
  }) async {
    if (state is AvailableTimeSlotsLoading) return;

    emit(AvailableTimeSlotsLoading(state.slots));

    final params = LoadAvailableTimeSlotsParams(
      isoDateString: isoDateString,
      serviceIds: serviceIds,
    );
    final res = await _loadAvailableTimeSlots(params);

    res.fold(
      (failure) => emit(
        AvailableTimeSlotsError(slots: state.slots, message: failure.message),
      ),

      (slots) => emit(AvailableTimeSlotsLoaded(slots)),
    );
  }

  void clear() {
    emit(AvailableTimeSlotsInitial());
  }
}
