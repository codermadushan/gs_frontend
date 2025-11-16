part of 'available_time_slots_cubit.dart';

@immutable
sealed class AvailableTimeSlotsState {
  List<TimeSlotEntity> get slots;
}

final class AvailableTimeSlotsInitial extends AvailableTimeSlotsState {
  @override
  final List<TimeSlotEntity> slots;

  AvailableTimeSlotsInitial() : slots = [];
}

final class AvailableTimeSlotsLoading extends AvailableTimeSlotsState {
  @override
  final List<TimeSlotEntity> slots;

  AvailableTimeSlotsLoading(this.slots);
}

final class AvailableTimeSlotsLoaded extends AvailableTimeSlotsState {
  @override
  final List<TimeSlotEntity> slots;

  AvailableTimeSlotsLoaded(this.slots);
}

final class AvailableTimeSlotsError extends AvailableTimeSlotsState {
  final String message;
  @override
  final List<TimeSlotEntity> slots;

  AvailableTimeSlotsError({required this.slots, required this.message});
}
