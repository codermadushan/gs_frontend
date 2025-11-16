part of 'create_reservation_cubit.dart';

@immutable
sealed class CreateReservationState {}

final class CreateReservationInitial extends CreateReservationState {}

final class CreateReservationLoading extends CreateReservationState {}

final class CreateReservationSuccess extends CreateReservationState {}

final class CreateReservationError extends CreateReservationState {
  final String message;

  CreateReservationError(this.message);
}
