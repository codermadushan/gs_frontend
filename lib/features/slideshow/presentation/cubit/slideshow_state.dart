part of 'slideshow_cubit.dart';

@immutable
sealed class SlideshowState {
  List<ImageEntity> get images;
}

final class SlideshowInitial extends SlideshowState {
  @override
  final List<ImageEntity> images;

  SlideshowInitial() : images = [];
}

final class SlideshowLoading extends SlideshowState {
  @override
  final List<ImageEntity> images;

  SlideshowLoading(this.images);
}

final class SlideshowLoaded extends SlideshowState {
  @override
  final List<ImageEntity> images;

  SlideshowLoaded(this.images);
}

final class SlideshowError extends SlideshowState {
  @override
  final List<ImageEntity> images;
  final String message;

  SlideshowError({required this.images, required this.message});
}
