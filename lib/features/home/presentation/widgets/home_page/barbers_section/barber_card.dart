import 'package:flutter/material.dart';

import '../../../../../../core/app_router.dart';
import '../../../../../../core/entities/barber_entity.dart';
import '../../../../../../core/widgets/tappable_card.dart';
import '../../../../../../core/constants/app_color.dart';
import '../../../../../../core/constants/app_size.dart';
import '../../../../../../core/constants/app_style.dart';

class BarberCard extends StatelessWidget {
  final BarberEntity _barber;

  const BarberCard(BarberEntity barber, {super.key}) : _barber = barber;

  @override
  Widget build(BuildContext context) {
    return TappableCard(
      padding: const EdgeInsets.symmetric(horizontal: AppSize.pagePadding),
      onTap: () async {
        await Navigator.pushNamed(
          context,
          AppRouter.serviceSelectionPage,
          arguments: _barber,
        );
      },
      child: Row(
        spacing: AppSize.pagePadding,
        children: [
          Container(
            width: AppSize.barberImageSize,
            height: AppSize.barberImageSize,
            decoration: BoxDecoration(
              color: AppColor.muted,
              image: DecorationImage(
                image: NetworkImage(_barber.imageUrl),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(AppSize.borderRadius),
            ),
          ),

          Text(
            _barber.name,
            style: AppStyle.h4.copyWith(color: AppColor.cardForeground),
          ),
        ],
      ),
    );
  }
}
