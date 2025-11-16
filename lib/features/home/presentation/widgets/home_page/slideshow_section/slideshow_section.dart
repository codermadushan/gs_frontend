import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/cubits/app_slideshow_images/app_slideshow_images_cubit.dart';
import 'slideshow.dart';
import 'slideshow_place_holder.dart';

class SlideshowSection extends StatelessWidget {
  const SlideshowSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppSlideshowImagesCubit, AppSlideshowImagesState>(
      builder: (context, state) {
        if (state.images.length < 2) {
          return const SlideshowPlaceHolder();
        }

        return Slideshow(
          imagePaths: state.images.map((image) => image.url).toList(),
          duration: const Duration(seconds: 5),
        );
      },
    );
  }
}
