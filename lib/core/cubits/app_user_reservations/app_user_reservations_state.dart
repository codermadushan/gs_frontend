part of 'app_user_reservations_cubit.dart';

@immutable
sealed class AppUserReservationsState {
  List<UserReservationEntity> get reservations;
}

final class AppUserReservationsInitial extends AppUserReservationsState {
  @override
  final List<UserReservationEntity> reservations;

  AppUserReservationsInitial() : reservations = [];
}

final class AppUserReservationsLoading extends AppUserReservationsState {
  @override
  final List<UserReservationEntity> reservations;

  AppUserReservationsLoading(this.reservations);
}

final class AppUserReservationsLoaded extends AppUserReservationsState {
  @override
  final List<UserReservationEntity> reservations;

  AppUserReservationsLoaded(this.reservations);
}

final class AppUserReservationsError extends AppUserReservationsState {
  final String message;
  @override
  final List<UserReservationEntity> reservations;

  AppUserReservationsError({required this.reservations, required this.message});
}
