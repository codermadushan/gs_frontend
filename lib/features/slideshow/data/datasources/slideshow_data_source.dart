import '../models/image_model.dart';

abstract interface class SlideshowDataSource {
  Future<List<ImageModel>> loadImages();
}
