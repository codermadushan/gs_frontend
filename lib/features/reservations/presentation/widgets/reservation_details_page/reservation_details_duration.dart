import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

import '../../../../../core/constants/app_color.dart';
import '../../../../../core/constants/app_size.dart';
import '../../../../../core/widgets/dash_line.dart';
import '../../../../../core/widgets/ring.dart';
import '../../../../../core/widgets/texts.dart';

class ReservationDetailsDuration extends StatelessWidget {
  static const _dateFormat = 'MMM d, yyyy';
  static const _timeFormat = 'h:mm a';

  final Color _reservationColor;
  final DateTime _startAt;
  final DateTime _endAt;

  const ReservationDetailsDuration({
    super.key,
    required Color reservationColor,
    required DateTime startAt,
    required DateTime endAt,
  }) : _reservationColor = reservationColor,
       _startAt = startAt,
       _endAt = endAt;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppTextH3(DateFormat(_timeFormat).format(_startAt)),
            AppTextBody(
              DateFormat(_dateFormat).format(_startAt),
              color: AppColor.mutedForeground,
            ),
          ],
        ),
        const SizedBox(width: AppSize.pagePadding),
        Ring(color: _reservationColor),
        Expanded(child: DashLine(color: _reservationColor)),
        Ring(color: _reservationColor),
        const SizedBox(width: AppSize.pagePadding),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            AppTextH3(DateFormat(_timeFormat).format(_endAt)),
            AppTextBody(
              DateFormat(_dateFormat).format(_endAt),
              color: AppColor.mutedForeground,
            ),
          ],
        ),
      ],
    );
  }
}
