import 'package:flutter/material.dart';

import '../../../../../../core/constants/app_size.dart';
import '../../../../../../core/entities/user_reservation_entity.dart';
import 'reservation_card.dart';

class ReservationList extends StatelessWidget {
  final List<UserReservationEntity> _reservations;

  const ReservationList(List<UserReservationEntity> reservations, {super.key})
    : _reservations = reservations;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    final cardWidth = screenWidth - 2 * AppSize.pagePadding;
    final cardHeight = (cardWidth / 16) * 9;

    return SizedBox(
      height: cardHeight,
      child: ListView.separated(
        separatorBuilder: (context, index) {
          return const SizedBox(width: AppSize.pagePadding);
        },
        padding: const EdgeInsets.symmetric(horizontal: AppSize.pagePadding),
        itemCount: _reservations.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return ReservationCard(_reservations[index]);
        },
      ),
    );
  }
}
