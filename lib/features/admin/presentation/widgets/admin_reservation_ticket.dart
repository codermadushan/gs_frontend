import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

import '../../../../core/constants/app_color.dart';
import '../../../../core/constants/app_size.dart';
import '../../../../core/utils/get_readable_duration.dart';
import '../../../../core/utils/get_reservation_color.dart';
import '../../../../core/widgets/dash_line.dart';
import '../../../../core/widgets/positioned_circle.dart';
import '../../../../core/widgets/ring.dart';
import '../../../../core/widgets/tappable_card.dart';
import '../../../../core/widgets/texts.dart';
import '../../domain/entities/admin_reservation_entity.dart';

class AdminReservationTicket extends StatelessWidget {
  static const _circleSize = 40.0;

  static const _dateFormat = 'd MMMM yyyy';
  static const _timeFormat = 'h:mm a';

  final AdminReservationEntity _reservation;
  final VoidCallback _onTap;

  const AdminReservationTicket({
    super.key,
    required AdminReservationEntity reservation,
    required VoidCallback onTap,
  }) : _reservation = reservation,
       _onTap = onTap;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    final ticketWidth = screenWidth - 2 * AppSize.pagePadding;
    final ticketHeight = (ticketWidth / 16) * 9;
    final statusColor = getReservationColor(_reservation.status);

    return Stack(
      children: [
        TappableCard(
          onTap: _onTap,

          padding: const EdgeInsetsGeometry.all(AppSize.pagePadding),
          borderColor: statusColor,
          width: ticketWidth,
          height: ticketHeight,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children: [
              Row(
                children: [
                  Icon(FontAwesomeIcons.person, color: statusColor),
                  const SizedBox(width: AppSize.pagePadding / 2),
                  AppTextH5(_reservation.authorName, color: statusColor),

                  const Spacer(),

                  AppTextH5(
                    getReadableDuration(
                      startAt: _reservation.startAt,
                      endAt: _reservation.endAt,
                    ),
                  ),
                ],
              ),

              Row(
                children: [
                  const SizedBox(width: _circleSize / 2),

                  AppTextH3(
                    DateFormat(_timeFormat).format(_reservation.startAt),
                  ),

                  const SizedBox(width: AppSize.pagePadding),

                  Ring(color: statusColor),

                  Expanded(child: DashLine(color: statusColor)),

                  Ring(color: statusColor),

                  const SizedBox(width: AppSize.pagePadding),

                  AppTextH3(DateFormat(_timeFormat).format(_reservation.endAt)),

                  const SizedBox(width: _circleSize / 2),
                ],
              ),

              Row(
                children: [
                  AppTextH5(DateFormat(_dateFormat).format(_reservation.date)),

                  const Spacer(),

                  AppTextH5(
                    'Rs: ${_reservation.estimatedPrice}/=',
                    color: AppColor.primary,
                  ),
                ],
              ),
            ],
          ),
        ),

        // Left half circle
        PositionedCircle(
          left: -_circleSize / 2,
          top: (ticketHeight - _circleSize) / 2,
          circleSize: _circleSize,
          borderColor: statusColor,
        ),

        // Right half circle
        PositionedCircle(
          right: -_circleSize / 2,
          top: (ticketHeight - _circleSize) / 2,
          circleSize: _circleSize,
          borderColor: statusColor,
        ),
      ],
    );
  }
}
