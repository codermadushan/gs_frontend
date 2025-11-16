import '../../../../core/utils/get_reservation_status.dart';
import '../../domain/entities/admin_reservation_entity.dart';

final class AdminReservationModel extends AdminReservationEntity {
  const AdminReservationModel({
    required super.id,
    required super.authorName,
    required super.date,
    required super.startAt,
    required super.endAt,
    required super.status,
    required super.estimatedPrice,
    required super.additionalInfo,
    required super.barberName,
    required super.barberImageUrl,
    required super.options,
  });

  factory AdminReservationModel.fromMap(Map<String, dynamic> map) {
    return AdminReservationModel(
      id: map['id'],
      authorName: map['author']['name'],
      date: DateTime.parse(map['date']).toLocal(),
      startAt: DateTime.parse(map['startAt']).toLocal(),
      endAt: DateTime.parse(map['endAt']).toLocal(),
      status: getReservationStatus(map['status']),
      estimatedPrice: map['estimatedPrice'],
      additionalInfo: map['additionalInfo'],
      barberName: map['barber']['name'],
      barberImageUrl: map['barber']['imageUrl'],
      options: (map['serviceOptions'] as List<dynamic>).map((option) {
        return option['label'] as String;
      }).toList(),
    );
  }
}
