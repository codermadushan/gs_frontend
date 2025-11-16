part of 'app_slideshow_images_cubit.dart';

@immutable
sealed class AppSlideshowImagesState {
  List<ImageEntity> get images;
}

final class AppSlideshowImagesInitial extends AppSlideshowImagesState {
  @override
  final List<ImageEntity> images;

  AppSlideshowImagesInitial() : images = [];
}

final class AppSlideshowImagesLoaded extends AppSlideshowImagesState {
  @override
  final List<ImageEntity> images;

  AppSlideshowImagesLoaded(this.images);
}
