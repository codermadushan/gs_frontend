part of 'accepted_reservations_cubit.dart';

@immutable
sealed class AcceptedReservationsState {
  List<AdminReservationEntity> get reservations;
}

final class AcceptedReservationsInitial extends AcceptedReservationsState {
  @override
  final List<AdminReservationEntity> reservations;

  AcceptedReservationsInitial() : reservations = [];
}

final class AcceptedReservationsLoading extends AcceptedReservationsState {
  @override
  final List<AdminReservationEntity> reservations;

  AcceptedReservationsLoading(this.reservations);
}

final class AcceptedReservationsLoaded extends AcceptedReservationsState {
  @override
  final List<AdminReservationEntity> reservations;

  AcceptedReservationsLoaded(this.reservations);
}

final class AcceptedReservationsError extends AcceptedReservationsState {
  final String message;

  @override
  final List<AdminReservationEntity> reservations;

  AcceptedReservationsError({
    required this.reservations,
    required this.message,
  });
}
