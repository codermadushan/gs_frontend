import 'package:flutter/material.dart';

import '../../../../../core/constants/app_color.dart';
import '../../../../../core/constants/app_size.dart';
import '../../../../../core/constants/app_style.dart';
import '../../../../../core/widgets/app_icon_button.dart';

class ServiceSelectionAppBar extends StatelessWidget {
  final String _name;
  final String _imageUrl;

  const ServiceSelectionAppBar({
    super.key,
    required String name,
    required String imageUrl,
  }) : _name = name,
       _imageUrl = imageUrl;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;

    return SliverAppBar(
      leading: Padding(
        padding: const EdgeInsets.only(left: AppSize.pagePadding),
        child: Center(
          child: AppIconButton(
            onPressed: () async {
              await Navigator.maybePop(context);
            },
            icon: const Icon(Icons.arrow_back_ios_rounded),
            backgroundColor: AppColor.foreground,
            foregroundColor: AppColor.background,
          ),
        ),
      ),
      flexibleSpace: FlexibleSpaceBar(
        background: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(_imageUrl),
              fit: BoxFit.cover,
            ),
          ),

          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [AppColor.background, Colors.transparent],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            ),
          ),
        ),
        title: Text(_name, style: AppStyle.h2),
        centerTitle: true,
      ),
      expandedHeight: width,
      pinned: true,
    );
  }
}
