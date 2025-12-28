import 'package:flutter/foundation.dart';

import 'package:fpdart/fpdart.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/usecases/async_use_case.dart';
import '../repositories/status_message_repository.dart';

@immutable
final class UpdateStatusMessageParams {
  final String message;
  final String color;

  const UpdateStatusMessageParams({required this.message, required this.color});
}

final class UpdateStatusMessage
    implements AsyncUseCase<Unit, UpdateStatusMessageParams> {
  final StatusMessageRepository _statusMessageRepository;

  const UpdateStatusMessage(StatusMessageRepository statusMessageRepository)
    : _statusMessageRepository = statusMessageRepository;

  @override
  Future<Either<Failure, Unit>> call(UpdateStatusMessageParams params) async {
    return await _statusMessageRepository.updateStatusMessage(
      message: params.message,
      color: params.color,
    );
  }
}
