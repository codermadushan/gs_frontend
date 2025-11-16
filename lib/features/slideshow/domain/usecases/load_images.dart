import 'package:flutter/foundation.dart';

import 'package:fpdart/fpdart.dart';

import '../../../../core/entities/image_entity.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/usecases/async_use_case.dart';
import '../repositories/slideshow_repository.dart';

@immutable
final class LoadImagesParams {}

final class LoadImages
    implements AsyncUseCase<List<ImageEntity>, LoadImagesParams> {
  final SlideshowRepository _slideshowRepository;

  const LoadImages(SlideshowRepository slideshowRepository)
    : _slideshowRepository = slideshowRepository;

  @override
  Future<Either<Failure, List<ImageEntity>>> call(
    LoadImagesParams params,
  ) async {
    return await _slideshowRepository.loadImages();
  }
}
