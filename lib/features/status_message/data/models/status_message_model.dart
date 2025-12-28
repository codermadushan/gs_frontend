import '../../../../core/utils/get_status_message_color.dart';
import '../../domain/entities/status_message_entity.dart';

final class StatusMessageModel extends StatusMessageEntity {
  const StatusMessageModel({required super.message, required super.color});

  factory StatusMessageModel.fromMap(Map<String, dynamic> map) {
    return StatusMessageModel(
      message: map['msg'],
      color: getStatusMessageColor(map['color']),
    );
  }
}
