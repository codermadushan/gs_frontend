import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

import '../../../../../core/utils/get_readable_duration.dart';
import '../../../../../core/widgets/texts.dart';

class ReservationDetailsDateAndDuration extends StatelessWidget {
  static const _dateFormat = 'd MMMM yyyy';

  final DateTime _date;
  final DateTime _startAt;
  final DateTime _endAt;

  const ReservationDetailsDateAndDuration({
    super.key,
    required DateTime date,
    required DateTime startAt,
    required DateTime endAt,
  }) : _date = date,
       _startAt = startAt,
       _endAt = endAt;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AppTextH5(DateFormat(_dateFormat).format(_date)),

        AppTextH5(getReadableDuration(startAt: _startAt, endAt: _endAt)),
      ],
    );
  }
}
