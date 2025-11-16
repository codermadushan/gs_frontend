import 'package:fpdart/fpdart.dart';

import '../../../../core/entities/image_entity.dart';
import '../../../../core/errors/failure.dart';

abstract interface class SlideshowRepository {
  Future<Either<Failure, List<ImageEntity>>> loadImages();
}
