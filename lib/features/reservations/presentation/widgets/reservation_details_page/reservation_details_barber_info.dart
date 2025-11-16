import 'package:flutter/material.dart';

import '../../../../../core/constants/app_color.dart';
import '../../../../../core/widgets/texts.dart';

class ReservationDetailsBarberInfo extends StatelessWidget {
  static const _avatarSize = 40.0;

  final String _name;
  final String _imageUrl;

  const ReservationDetailsBarberInfo({
    super.key,
    required String name,
    required String imageUrl,
  }) : _name = name,
       _imageUrl = imageUrl;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,

      children: [
        Container(
          width: _avatarSize,
          height: _avatarSize,

          decoration: BoxDecoration(
            color: AppColor.muted,
            image: DecorationImage(
              image: NetworkImage(_imageUrl),
              fit: BoxFit.cover,
            ),
            shape: BoxShape.circle,
            border: Border.all(color: AppColor.cardForeground),
          ),
        ),

        AppTextH4(_name),
      ],
    );
  }
}
