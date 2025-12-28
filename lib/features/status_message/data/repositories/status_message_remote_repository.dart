import 'package:fpdart/fpdart.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/errors/server_exception.dart';
import '../../domain/entities/status_message_entity.dart';
import '../../domain/repositories/status_message_repository.dart';
import '../datasources/status_message_data_source.dart';

final class StatusMessageRemoteRepository implements StatusMessageRepository {
  final StatusMessageDataSource _statusMessageDataSource;

  const StatusMessageRemoteRepository(
    StatusMessageDataSource statusMessageDataSource,
  ) : _statusMessageDataSource = statusMessageDataSource;

  @override
  Future<Either<Failure, StatusMessageEntity>> getStatusMessage() async {
    try {
      final statusMessageModel = await _statusMessageDataSource
          .getStatusMessage();
      return right(statusMessageModel);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, Unit>> updateStatusMessage({
    required String message,
    required String color,
  }) {
    throw UnimplementedError();
  }
}
