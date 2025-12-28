part of 'get_status_message_cubit.dart';

@immutable
sealed class GetStatusMessageState {}

final class GetStatusMessageInitial extends GetStatusMessageState {}

final class GetStatusMessageLoading extends GetStatusMessageState {}

final class GetStatusMessageLoaded extends GetStatusMessageState {
  final StatusMessageEntity statusMessage;

  GetStatusMessageLoaded(this.statusMessage);
}

final class GetStatusMessageError extends GetStatusMessageState {
  final String message;

  GetStatusMessageError(this.message);
}
