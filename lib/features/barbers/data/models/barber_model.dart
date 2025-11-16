import '../../../../core/entities/barber_entity.dart';

final class BarberModel extends BarberEntity {
  const BarberModel({
    required super.id,
    required super.name,
    required super.imageUrl,
  });

  factory BarberModel.fromMap(Map<String, dynamic> map) {
    return BarberModel(
      id: map['id'],
      name: map['name'],
      imageUrl: map['imageUrl'],
    );
  }
}
