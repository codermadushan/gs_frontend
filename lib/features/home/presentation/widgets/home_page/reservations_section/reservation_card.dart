import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

import '../../../../../../core/app_router.dart';
import '../../../../../../core/constants/app_color.dart';
import '../../../../../../core/constants/app_size.dart';
import '../../../../../../core/entities/user_reservation_entity.dart';
import '../../../../../../core/utils/get_readable_duration.dart';
import '../../../../../../core/utils/get_reservation_color.dart';
import '../../../../../../core/widgets/dash_line.dart';
import '../../../../../../core/widgets/ring.dart';
import '../../../../../../core/widgets/tappable_card.dart';
import '../../../../../../core/widgets/texts.dart';
import '../../../../../../core/widgets/positioned_circle.dart';
import 'reservation_state_chip.dart';

class ReservationCard extends StatelessWidget {
  static const _circleSize = 40.0;

  static const _dateFormat = 'd MMMM yyyy';
  static const _timeFormat = 'h:mm a';

  final UserReservationEntity _reservation;

  const ReservationCard(UserReservationEntity reservation, {super.key})
    : _reservation = reservation;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    final cardWidth = screenWidth - (2 * AppSize.pagePadding);
    final cardHeight = (cardWidth / 16) * 9;

    final reservationColor = getReservationColor(_reservation.status);

    return Stack(
      children: [
        TappableCard(
          onTap: () async {
            await Navigator.pushNamed(
              context,
              AppRouter.reservationDetailsPage,
              arguments: _reservation,
            );
          },
          padding: const EdgeInsets.all(AppSize.pagePadding),
          width: cardWidth,
          borderColor: reservationColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: [
                  ReservationStateChip(_reservation.status),
                  AppTextH5(
                    getReadableDuration(
                      startAt: _reservation.startAt,
                      endAt: _reservation.endAt,
                    ),
                  ),
                ],
              ),

              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal:
                      (_circleSize / 2 - AppSize.pagePadding) +
                      AppSize.pagePadding,
                ),
                child: Row(
                  children: [
                    AppTextH3(
                      DateFormat(_timeFormat).format(_reservation.startAt),
                      color: AppColor.cardForeground,
                    ),
                    const SizedBox(width: AppSize.pagePadding),
                    Ring(color: reservationColor),
                    Expanded(child: DashLine(color: reservationColor)),
                    Ring(color: reservationColor),
                    const SizedBox(width: AppSize.pagePadding),
                    AppTextH3(
                      DateFormat(_timeFormat).format(_reservation.endAt),
                      color: AppColor.cardForeground,
                    ),
                  ],
                ),
              ),

              SizedBox(
                height: 32,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                  children: [
                    AppTextH5(
                      DateFormat(_dateFormat).format(_reservation.date),
                      color: AppColor.cardForeground,
                    ),

                    AppTextH5(
                      'Rs: ${_reservation.estimatedPrice}/=',
                      color: AppColor.primary,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

        // Left circle
        PositionedCircle(
          borderColor: reservationColor,
          circleSize: _circleSize,
          top: (cardHeight - _circleSize) / 2,
          left: -_circleSize / 2,
        ),

        // Right circle
        PositionedCircle(
          borderColor: reservationColor,
          circleSize: _circleSize,
          top: (cardHeight - _circleSize) / 2,
          right: -_circleSize / 2,
        ),
      ],
    );
  }
}
