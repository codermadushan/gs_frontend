import '../../../../core/entities/user_reservation_entity.dart';
import '../../../../core/utils/get_reservation_status.dart';

final class UserReservationModel extends UserReservationEntity {
  const UserReservationModel({
    required super.id,
    required super.date,
    required super.startAt,
    required super.endAt,
    required super.estimatedPrice,
    required super.additionalInfo,
    required super.status,
    required super.rejectionReason,
    required super.barberName,
    required super.barberImageUrl,
    required super.options,
  });

  factory UserReservationModel.fromMap(Map<String, dynamic> map) {
    return UserReservationModel(
      id: map['id'],
      date: DateTime.parse(map['date']).toLocal(),
      startAt: DateTime.parse(map['startAt']).toLocal(),
      endAt: DateTime.parse(map['endAt']).toLocal(),
      estimatedPrice: map['estimatedPrice'],
      additionalInfo: map['additionalInfo'],
      status: getReservationStatus(map['status']),
      rejectionReason: map['rejectionReason'],
      barberName: map['barber']['name'],
      barberImageUrl: map['barber']['imageUrl'],
      options: (map['serviceOptions'] as List<dynamic>).map((option) {
        return option['label'] as String;
      }).toList(),
    );
  }
}
