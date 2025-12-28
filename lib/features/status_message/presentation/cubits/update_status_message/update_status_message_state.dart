part of 'update_status_message_cubit.dart';

@immutable
sealed class UpdateStatusMessageState {}

final class UpdateStatusMessageInitial extends UpdateStatusMessageState {}

final class UpdateStatusMessageLoading extends UpdateStatusMessageState {}

final class UpdateStatusMessageSuccess extends UpdateStatusMessageState {}

final class UpdateStatusMessageError extends UpdateStatusMessageState {
  final String message;

  UpdateStatusMessageError(this.message);
}
