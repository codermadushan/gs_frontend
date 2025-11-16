import 'package:fpdart/fpdart.dart';

import '../../../../core/entities/image_entity.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/errors/server_exception.dart';
import '../../domain/repositories/slideshow_repository.dart';
import '../datasources/slideshow_data_source.dart';

final class SlideshowRemoteRepository implements SlideshowRepository {
  final SlideshowDataSource _slideshowDataSource;

  const SlideshowRemoteRepository(SlideshowDataSource slideshowDataSource)
    : _slideshowDataSource = slideshowDataSource;

  @override
  Future<Either<Failure, List<ImageEntity>>> loadImages() async {
    try {
      final imageModels = await _slideshowDataSource.loadImages();
      return right(imageModels);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }
}
