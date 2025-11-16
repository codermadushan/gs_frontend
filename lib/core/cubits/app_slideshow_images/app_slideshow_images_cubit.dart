import 'package:flutter/foundation.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../entities/image_entity.dart';

part 'app_slideshow_images_state.dart';

class AppSlideshowImagesCubit extends Cubit<AppSlideshowImagesState> {
  late final VoidCallback loadImages;

  AppSlideshowImagesCubit() : super(AppSlideshowImagesInitial());

  void updateImages(List<ImageEntity> images) {
    emit(AppSlideshowImagesLoaded(images));
  }
}
