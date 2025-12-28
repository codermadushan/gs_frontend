import 'package:fpdart/fpdart.dart';

import '../models/status_message_model.dart';

abstract interface class StatusMessageDataSource {
  Future<StatusMessageModel> getStatusMessage();

  Future<Unit> updateStatusMessage({
    required String message,
    required String color,
  });
}
