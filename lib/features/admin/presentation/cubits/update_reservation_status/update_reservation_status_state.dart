part of 'update_reservation_status_cubit.dart';

@immutable
sealed class UpdateReservationStatusState {}

final class UpdateReservationStatusInitial
    extends UpdateReservationStatusState {}

final class UpdateReservationStatusLoading
    extends UpdateReservationStatusState {}

final class UpdateReservationStatusSuccess
    extends UpdateReservationStatusState {}

final class UpdateReservationStatusError extends UpdateReservationStatusState {
  final String message;

  UpdateReservationStatusError(this.message);
}
