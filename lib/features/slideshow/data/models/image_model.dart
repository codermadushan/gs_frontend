import '../../../../core/entities/image_entity.dart';

final class ImageModel extends ImageEntity {
  const ImageModel({required super.id, required super.url});

  factory ImageModel.fromMap(Map<String, dynamic> map) {
    return ImageModel(id: map['id'], url: map['url']);
  }
}
