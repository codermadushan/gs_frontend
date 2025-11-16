import 'package:flutter/foundation.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/cubits/app_slideshow_images/app_slideshow_images_cubit.dart';
import '../../../../core/entities/image_entity.dart';
import '../../domain/usecases/load_images.dart';

part 'slideshow_state.dart';

class SlideshowCubit extends Cubit<SlideshowState> {
  final AppSlideshowImagesCubit _appSlideshowImagesCubit;

  final LoadImages _loadImages;

  SlideshowCubit({
    required LoadImages loadImages,
    required AppSlideshowImagesCubit appSlideshowImagesCubit,
  }) : _loadImages = loadImages,
       _appSlideshowImagesCubit = appSlideshowImagesCubit,
       super(SlideshowInitial()) {
    _appSlideshowImagesCubit.loadImages = __loadImages;
  }

  Future<void> __loadImages() async {
    if (state is SlideshowLoading) return;

    emit(SlideshowLoading(state.images));

    final params = LoadImagesParams();
    final res = await _loadImages(params);

    res.fold(
      (failure) {
        emit(SlideshowError(images: state.images, message: failure.message));
      },
      (images) {
        _appSlideshowImagesCubit.updateImages(images);
        emit(SlideshowLoaded(images));
      },
    );
  }
}
