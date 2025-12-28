import 'package:fpdart/fpdart.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/usecases/async_use_case.dart';
import '../entities/status_message_entity.dart';
import '../repositories/status_message_repository.dart';

final class GetStatusMessageParams {}

final class GetStatusMessage
    implements AsyncUseCase<StatusMessageEntity, GetStatusMessageParams> {
  final StatusMessageRepository _statusMessageRepository;

  const GetStatusMessage(StatusMessageRepository statusMessageRepository)
    : _statusMessageRepository = statusMessageRepository;

  @override
  Future<Either<Failure, StatusMessageEntity>> call(
    GetStatusMessageParams params,
  ) async {
    return await _statusMessageRepository.getStatusMessage();
  }
}
