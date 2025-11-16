part of 'pending_reservations_cubit.dart';

@immutable
sealed class PendingReservationsState {
  List<AdminReservationEntity> get reservations;
}

final class PendingReservationsInitial extends PendingReservationsState {
  @override
  final List<AdminReservationEntity> reservations;

  PendingReservationsInitial() : reservations = [];
}

final class PendingReservationsLoading extends PendingReservationsState {
  @override
  final List<AdminReservationEntity> reservations;

  PendingReservationsLoading(this.reservations);
}

final class PendingReservationsLoaded extends PendingReservationsState {
  @override
  final List<AdminReservationEntity> reservations;

  PendingReservationsLoaded(this.reservations);
}

final class PendingReservationsError extends PendingReservationsState {
  final String message;

  @override
  final List<AdminReservationEntity> reservations;

  PendingReservationsError({required this.reservations, required this.message});
}
