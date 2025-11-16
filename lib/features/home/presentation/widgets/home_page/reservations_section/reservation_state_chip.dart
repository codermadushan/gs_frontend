import 'package:flutter/material.dart';

import '../../../../../../core/constants/app_size.dart';
import '../../../../../../core/enums/reservation_status.dart';
import '../../../../../../core/utils/get_reservation_color.dart';
import '../../../../../../core/utils/get_reservation_icon.dart';
import '../../../../../../core/widgets/texts.dart';

class ReservationStateChip extends StatefulWidget {
  final ReservationStatus _state;

  const ReservationStateChip(ReservationStatus state, {super.key})
    : _state = state;

  @override
  State<ReservationStateChip> createState() => _ReservationStateChipState();
}

class _ReservationStateChipState extends State<ReservationStateChip> {
  late final Color _reservationColor;

  @override
  void initState() {
    super.initState();

    _reservationColor = getReservationColor(widget._state);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSize.pagePadding / 2,
        vertical: AppSize.pagePadding / 4,
      ),
      decoration: BoxDecoration(
        color: _reservationColor.withAlpha(AppSize.opacityAlpha),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        spacing: AppSize.pagePadding / 4,

        children: [
          Icon(getReservationIcon(widget._state), color: _reservationColor),

          AppTextH5(widget._state.label, color: _reservationColor),
        ],
      ),
    );
  }
}
