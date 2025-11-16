import 'dart:async';
import 'package:flutter/material.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../../../core/constants/app_color.dart';
import '../../../../../../core/constants/app_size.dart';

class Slideshow extends StatefulWidget {
  final List<String> _imagePaths;
  final Duration _duration;

  const Slideshow({
    super.key,
    required List<String> imagePaths,
    required Duration duration,
  }) : _imagePaths = imagePaths,
       _duration = duration;

  @override
  State<Slideshow> createState() => _SlideshowState();
}

class _SlideshowState extends State<Slideshow> {
  final _carouselController = CarouselController();
  final _pageController = PageController();
  Timer? _timer;
  int _currentImageIndex = 0;
  bool _isReverse = false;

  @override
  void initState() {
    super.initState();

    const duration = Duration(seconds: 2);
    const curve = Curves.fastOutSlowIn;
    _timer = Timer.periodic(widget._duration, (timer) {
      if (_isReverse) {
        _currentImageIndex--;
      } else {
        _currentImageIndex++;
      }

      _carouselController.animateToItem(
        _currentImageIndex,
        duration: duration,
        curve: curve,
      );
      _pageController.animateToPage(
        _currentImageIndex,
        duration: duration,
        curve: curve,
      );

      if (_currentImageIndex == widget._imagePaths.length - 1) {
        _isReverse = true;
      } else if (_currentImageIndex == 0) {
        _isReverse = false;
      }
    });
  }

  @override
  void dispose() {
    _carouselController.dispose();
    _pageController.dispose();

    _timer?.cancel();
    _timer = null;

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Image show
        SizedBox(
          height: ((width - (AppSize.pagePadding * 2)) / 16) * 9,

          child: ClipRRect(
            borderRadius: BorderRadiusGeometry.circular(AppSize.borderRadius),

            child: CarouselView.weighted(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSize.pagePadding,
              ),
              backgroundColor: AppColor.muted,
              controller: _carouselController,
              enableSplash: false,
              itemSnapping: true,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppSize.borderRadius),
              ),
              flexWeights: const [1],

              children: List.generate(widget._imagePaths.length, (index) {
                return Image.network(
                  widget._imagePaths[index],
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.cover,
                );
              }),
            ),
          ),
        ),

        const SizedBox(height: AppSize.gapSmall),

        SizedBox(
          height: 0,
          width: 1,
          child: PageView(
            controller: _pageController,
            children: List.generate(widget._imagePaths.length, (index) {
              return const SizedBox();
            }),
          ),
        ),

        // Page indicator
        SmoothPageIndicator(
          controller: _pageController,
          count: widget._imagePaths.length,
          effect: const WormEffect(
            dotWidth: 12,
            dotHeight: 6,
            activeDotColor: AppColor.foreground,
            dotColor: AppColor.muted,
          ),
        ),
      ],
    );
  }
}
