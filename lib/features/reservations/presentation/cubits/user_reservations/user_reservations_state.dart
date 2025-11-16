part of 'user_reservations_cubit.dart';

@immutable
sealed class UserReservationsState {
  List<UserReservationEntity> get reservations;
}

final class UserReservationsInitial extends UserReservationsState {
  @override
  final List<UserReservationEntity> reservations;

  UserReservationsInitial() : reservations = [];
}

final class UserReservationsLoading extends UserReservationsState {
  @override
  final List<UserReservationEntity> reservations;

  UserReservationsLoading(this.reservations);
}

final class UserReservationsLoaded extends UserReservationsState {
  @override
  final List<UserReservationEntity> reservations;

  UserReservationsLoaded(this.reservations);
}

final class UserReservationsError extends UserReservationsState {
  final String message;
  @override
  final List<UserReservationEntity> reservations;

  UserReservationsError({required this.message, required this.reservations});
}
