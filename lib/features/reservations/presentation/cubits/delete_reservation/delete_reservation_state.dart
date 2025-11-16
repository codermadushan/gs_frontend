part of 'delete_reservation_cubit.dart';

@immutable
sealed class DeleteReservationState {}

final class DeleteReservationInitial extends DeleteReservationState {}

final class DeleteReservationLoading extends DeleteReservationState {}

final class DeleteReservationSuccess extends DeleteReservationState {}

final class DeleteReservationError extends DeleteReservationState {
  final String message;

  DeleteReservationError(this.message);
}
