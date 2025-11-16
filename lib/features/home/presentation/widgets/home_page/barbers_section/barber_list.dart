import 'package:flutter/material.dart';

import '../../../../../../core/constants/app_size.dart';
import '../../../../../../core/entities/barber_entity.dart';
import 'barber_card.dart';

class BarberList extends StatelessWidget {
  final List<BarberEntity> _barbers;

  const BarberList(List<BarberEntity> barbers, {super.key})
    : _barbers = barbers;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSize.barberImageSize + (AppSize.pagePadding * 2),
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: AppSize.pagePadding),
        itemCount: _barbers.length,
        scrollDirection: Axis.horizontal,

        separatorBuilder: (context, index) {
          return const SizedBox(width: AppSize.pagePadding);
        },

        itemBuilder: (context, index) {
          final barber = _barbers[index];

          return BarberCard(barber);
        },
      ),
    );
  }
}
