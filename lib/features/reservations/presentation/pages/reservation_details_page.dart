import 'package:flutter/material.dart';

import '../../../../core/constants/app_color.dart';
import '../../../../core/constants/app_size.dart';
import '../../../../core/entities/user_reservation_entity.dart';
import '../../../../core/enums/reservation_status.dart';
import '../../../../core/utils/get_reservation_color.dart';
import '../../../../core/widgets/app_card.dart';
import '../../../../core/widgets/dash_line.dart';
import '../../../../core/widgets/positioned_circle.dart';
import '../widgets/reservation_details_page/reservation_delete_button.dart';
import '../widgets/reservation_details_page/reservation_details_additional_info.dart';
import '../widgets/reservation_details_page/reservation_details_app_bar.dart';
import '../widgets/reservation_details_page/reservation_details_barber_info.dart';
import '../widgets/reservation_details_page/reservation_details_date_and_duration.dart';
import '../widgets/reservation_details_page/reservation_details_duration.dart';
import '../widgets/reservation_details_page/reservation_details_rejection.dart';
import '../widgets/reservation_details_page/reservation_details_services.dart';
import '../widgets/reservation_details_page/reservation_details_status_and_price.dart';

class ReservationDetailsPage extends StatefulWidget {
  const ReservationDetailsPage({super.key});

  @override
  State<ReservationDetailsPage> createState() => _ReservationDetailsPageState();
}

class _ReservationDetailsPageState extends State<ReservationDetailsPage> {
  static const _positionedCircleSize = 40.0;
  static const _dashHeight = 2.0;

  late final UserReservationEntity _reservation;
  late final Color _reservationColor;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _reservation =
        ModalRoute.settingsOf(context)!.arguments as UserReservationEntity;
    _reservationColor = getReservationColor(_reservation.status);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ReservationDetailsAppBar(),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppSize.pagePadding),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: AppSize.gapLarge),

                Stack(
                  children: [
                    AppCard(
                      borderColor: _reservationColor,
                      padding: const EdgeInsets.all(AppSize.pagePadding),
                      child: Column(
                        children: [
                          ReservationDetailsStatusAndPrice(
                            estimatedPrice: _reservation.estimatedPrice,
                            status: _reservation.status,
                          ),

                          const SizedBox(
                            height:
                                AppSize.pagePadding +
                                _positionedCircleSize / 2 -
                                _dashHeight / 2,
                          ),

                          const DashLine(
                            dashHeight: _dashHeight,
                            color: AppColor.mutedForeground,
                          ),

                          const SizedBox(
                            height:
                                _positionedCircleSize / 2 + AppSize.pagePadding,
                          ),

                          ReservationDetailsDateAndDuration(
                            date: _reservation.date,
                            startAt: _reservation.startAt,
                            endAt: _reservation.endAt,
                          ),

                          const SizedBox(
                            height:
                                _positionedCircleSize / 2 + AppSize.pagePadding,
                          ),

                          ReservationDetailsDuration(
                            reservationColor: _reservationColor,
                            startAt: _reservation.startAt,
                            endAt: _reservation.endAt,
                          ),

                          const SizedBox(
                            height:
                                AppSize.pagePadding + _positionedCircleSize / 2,
                          ),

                          ReservationDetailsBarberInfo(
                            name: _reservation.barberName,
                            imageUrl: _reservation.barberImageUrl,
                          ),

                          if (_reservation.status == ReservationStatus.rejected)
                            const SizedBox(
                              height:
                                  AppSize.pagePadding +
                                  _positionedCircleSize / 2,
                            ),

                          if (_reservation.status == ReservationStatus.rejected)
                            ReservationDetailsRejection(
                              _reservation.rejectionReason,
                            ),

                          const SizedBox(
                            height:
                                AppSize.pagePadding + _positionedCircleSize / 2,
                          ),

                          ReservationDetailsServices(_reservation.options),

                          if (_reservation.additionalInfo.isNotEmpty)
                            const SizedBox(
                              height:
                                  AppSize.pagePadding +
                                  _positionedCircleSize / 2,
                            ),

                          if (_reservation.additionalInfo.isNotEmpty)
                            ReservationDetailsAdditionalInfo(
                              _reservation.additionalInfo,
                            ),
                        ],
                      ),
                    ),

                    // Left half circle
                    // 40 - height of ReservationDetailsStatusAndPrice widget
                    PositionedCircle(
                      borderColor: _reservationColor,
                      circleSize: _positionedCircleSize,
                      left: -_positionedCircleSize / 2,
                      top: 40 + (2 * AppSize.pagePadding),
                    ),

                    // Right half circle
                    // 40 - height of ReservationDetailsStatusAndPrice widget
                    PositionedCircle(
                      borderColor: _reservationColor,
                      circleSize: _positionedCircleSize,
                      right: -_positionedCircleSize / 2,
                      top: 40 + (2 * AppSize.pagePadding),
                    ),
                  ],
                ),

                const SizedBox(height: AppSize.gapLarge),

                ReservationDeleteButton(
                  reservationId: _reservation.id,
                  reservationStatus: _reservation.status,
                ),

                const SizedBox(height: AppSize.gapLarge),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
