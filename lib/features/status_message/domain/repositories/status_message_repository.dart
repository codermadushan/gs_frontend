import 'package:fpdart/fpdart.dart';

import '../../../../core/errors/failure.dart';
import '../entities/status_message_entity.dart';

abstract interface class StatusMessageRepository {
  Future<Either<Failure, StatusMessageEntity>> getStatusMessage();

  Future<Either<Failure, Unit>> updateStatusMessage({
    required String message,
    required String color,
  });
}
