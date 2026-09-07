import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

import '../../../../core/constants/app_color.dart';
import '../../../../core/constants/app_size.dart';
import '../../../../core/utils/get_readable_duration.dart';
import '../../../../core/utils/get_reservation_color.dart';
import '../../../../core/widgets/app_card.dart';
import '../../../../core/widgets/dash_line.dart';
import '../../../../core/widgets/positioned_circle.dart';
import '../../../../core/widgets/ring.dart';
import '../../../../core/widgets/texts.dart';
import '../../domain/entities/admin_reservation_entity.dart';

class AdminReservationTicketDetails extends StatelessWidget {
  static const _circleSize = 40.0;
  static const _dashHeight = 2.0;

  static const _fullDateFormat = 'd MMMM yyyy';
  static const _dateFormat = 'MMM d, yyyy';
  static const _timeFormat = 'h:mm a';

  final AdminReservationEntity _reservation;

  const AdminReservationTicketDetails(
    AdminReservationEntity reservation, {
    super.key,
  }) : _reservation = reservation;

  @override
  Widget build(BuildContext context) {
    final statusColor = getReservationColor(_reservation.status);

    return Stack(
      children: [
        AppCard(
          borderColor: statusColor,
          padding: const EdgeInsets.all(AppSize.pagePadding),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    width: _circleSize,
                    height: _circleSize,
                    decoration: BoxDecoration(
                      border: Border.all(color: statusColor),
                      shape: BoxShape.circle,
                      color: statusColor.withAlpha(AppSize.opacityAlpha),
                    ),
                    child: Icon(Icons.person_rounded, color: statusColor),
                  ),
                  const SizedBox(width: AppSize.pagePadding / 2),
                  AppTextH5(_reservation.authorName, color: statusColor),
                  const Spacer(),
                  AppTextH5(
                    'Rs: ${_reservation.estimatedPrice}/=',
                    color: AppColor.primary,
                  ),
                ],
              ),

              const SizedBox(
                height: AppSize.pagePadding + _circleSize / 2 - _dashHeight / 2,
              ),

              const DashLine(
                dashHeight: _dashHeight,
                color: AppColor.mutedForeground,
                paddingHorizontal: _circleSize / 2 - AppSize.pagePadding,
              ),

              const SizedBox(height: _circleSize / 2 + AppSize.pagePadding),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: [
                  AppTextH5(
                    DateFormat(_fullDateFormat).format(_reservation.date),
                  ),

                  AppTextH5(
                    getReadableDuration(
                      startAt: _reservation.startAt,
                      endAt: _reservation.endAt,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: _circleSize / 2 + AppSize.pagePadding),

              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppTextH3(
                        DateFormat(_timeFormat).format(_reservation.startAt),
                      ),

                      AppTextBody(
                        DateFormat(_dateFormat).format(_reservation.startAt),
                        color: AppColor.mutedForeground,
                      ),
                    ],
                  ),

                  const SizedBox(width: AppSize.pagePadding),

                  Ring(color: statusColor),

                  Expanded(child: DashLine(color: statusColor)),

                  Ring(color: statusColor),

                  const SizedBox(width: AppSize.pagePadding),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      AppTextH3(
                        DateFormat(_timeFormat).format(_reservation.endAt),
                      ),

                      AppTextBody(
                        DateFormat(_dateFormat).format(_reservation.endAt),
                        color: AppColor.mutedForeground,
                      ),
                    ],
                  ),
                ],
              ),

              const SizedBox(height: _circleSize / 2 + AppSize.pagePadding),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: _circleSize,
                    height: _circleSize,
                    decoration: BoxDecoration(
                      color: AppColor.muted,
                      image: DecorationImage(
                        image: NetworkImage(_reservation.barberImageUrl),
                        fit: BoxFit.cover,
                      ),
                      shape: BoxShape.circle,
                      border: Border.all(color: AppColor.cardForeground),
                    ),
                  ),

                  AppTextH4(_reservation.barberName),
                ],
              ),

              const SizedBox(height: _circleSize / 2 + AppSize.pagePadding),

              Container(
                padding: const EdgeInsets.all(AppSize.pagePadding),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColor.muted,
                  borderRadius: BorderRadius.circular(AppSize.borderRadius),
                ),
                child: Column(
                  spacing: AppSize.pagePadding,
                  children: List.generate(_reservation.options.length, (index) {
                    return Row(
                      spacing: AppSize.pagePadding,
                      children: [
                        const CircleAvatar(
                          radius: 6,
                          backgroundColor: AppColor.primary,
                        ),

                        Expanded(child: AppTextH6(_reservation.options[index])),
                      ],
                    );
                  }),
                ),
              ),

              if (_reservation.additionalInfo.isNotEmpty)
                const SizedBox(height: _circleSize / 2 + AppSize.pagePadding),

              if (_reservation.additionalInfo.isNotEmpty)
                Container(
                  padding: const EdgeInsets.all(AppSize.pagePadding),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColor.muted,
                    borderRadius: BorderRadius.circular(AppSize.borderRadius),
                  ),
                  child: AppTextBody(
                    _reservation.additionalInfo,
                    textAlign: TextAlign.center,
                  ),
                ),
            ],
          ),
        ),

        // Left half circle
        PositionedCircle(
          top: 40 + 2 * AppSize.pagePadding, // 40 is top Raw height
          left: -_circleSize / 2,
          circleSize: _circleSize,
          borderColor: statusColor,
        ),

        // Right half circle
        PositionedCircle(
          top: 40 + 2 * AppSize.pagePadding, // 40 is top Raw height
          right: -_circleSize / 2,
          circleSize: _circleSize,
          borderColor: statusColor,
        ),
      ],
    );
  }
}
