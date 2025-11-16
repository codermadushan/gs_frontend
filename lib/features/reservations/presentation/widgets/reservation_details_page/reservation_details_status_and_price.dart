import 'package:flutter/material.dart';

import '../../../../../core/constants/app_color.dart';
import '../../../../../core/constants/app_size.dart';
import '../../../../../core/enums/reservation_status.dart';
import '../../../../../core/utils/get_reservation_color.dart';
import '../../../../../core/utils/get_reservation_icon.dart';
import '../../../../../core/widgets/texts.dart';

class ReservationDetailsStatusAndPrice extends StatefulWidget {
  final ReservationStatus _status;
  final int _estimatedPrice;

  const ReservationDetailsStatusAndPrice({
    super.key,
    required ReservationStatus status,
    required int estimatedPrice,
  }) : _status = status,
       _estimatedPrice = estimatedPrice;

  @override
  State<ReservationDetailsStatusAndPrice> createState() =>
      _ReservationDetailsStatusAndPriceState();
}

class _ReservationDetailsStatusAndPriceState
    extends State<ReservationDetailsStatusAndPrice> {
  static const _statusCircleSize = 40.0;

  late final Color _reservationColor;

  @override
  void initState() {
    super.initState();

    _reservationColor = getReservationColor(widget._status);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: _statusCircleSize,
          height: _statusCircleSize,
          decoration: BoxDecoration(
            color: _reservationColor.withAlpha(AppSize.opacityAlpha),
            shape: BoxShape.circle,
            border: Border.all(color: _reservationColor),
          ),
          child: Icon(
            getReservationIcon(widget._status),
            color: _reservationColor,
          ),
        ),

        const SizedBox(width: AppSize.pagePadding / 2),

        AppTextH5(widget._status.label, color: _reservationColor),

        const Spacer(),

        AppTextH5('Rs: ${widget._estimatedPrice}/=', color: AppColor.primary),
      ],
    );
  }
}
