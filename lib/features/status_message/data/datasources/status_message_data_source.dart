import '../../../../core/enums/status_message_color.dart';
import '../models/status_message_model.dart';

abstract interface class StatusMessageDataSource {
  Future<String> getStatusMessage();

  Future<StatusMessageModel> updateStatusMessage({
    required String message,
    required StatusMessageColor color,
  });
}
