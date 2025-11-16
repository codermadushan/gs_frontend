import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../core/app_router.dart';
import '../../../../core/constants/app_color.dart';
import '../../../../core/constants/app_size.dart';
import '../../../../core/widgets/app_icon_button.dart';
import '../../../../core/widgets/main_button.dart';
import '../../../../core/widgets/texts.dart';
import '../../domain/entities/admin_reservation_entity.dart';
import '../widgets/admin_reservation_ticket_details.dart';

class AcceptedReservationDetailsPage extends StatefulWidget {
  const AcceptedReservationDetailsPage({super.key});

  @override
  State<AcceptedReservationDetailsPage> createState() =>
      _AcceptedReservationDetailsPageState();
}

class _AcceptedReservationDetailsPageState
    extends State<AcceptedReservationDetailsPage> {
  late final AdminReservationEntity _reservation;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _reservation =
        ModalRoute.settingsOf(context)!.arguments as AdminReservationEntity;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: AppSize.pagePadding),
          child: Center(
            child: AppIconButton(
              backgroundColor: AppColor.foreground,
              foregroundColor: AppColor.background,
              icon: const Icon(FontAwesomeIcons.arrowLeft),
              onPressed: () async {
                await Navigator.maybePop(context);
              },
            ),
          ),
        ),

        title: const AppTextH2('Reservation details'),
        centerTitle: true,
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppSize.pagePadding),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: AppSize.gapLarge),

                AdminReservationTicketDetails(_reservation),

                const SizedBox(height: AppSize.gapLarge),

                Row(
                  spacing: AppSize.pagePadding,
                  children: [
                    Expanded(
                      child: MainButton(
                        foregroundColor: AppColor.foreground,
                        backgroundColor: AppColor.destructive,
                        onPressed: () async {
                          await Navigator.pushNamed(
                            context,
                            AppRouter.rejectAcceptedReservationPage,
                            arguments: _reservation.id,
                          );
                        },
                        label: 'Reject',
                        icon: FontAwesomeIcons.solidCircleXmark,
                      ),
                    ),

                    Expanded(
                      child: MainButton(
                        foregroundColor: AppColor.foreground,
                        backgroundColor: AppColor.success,
                        onPressed: () async {
                          await Navigator.pushNamed(
                            context,
                            AppRouter.completeAcceptedReservationPage,
                            arguments: _reservation.id,
                          );
                        },
                        label: 'Complete',
                        icon: FontAwesomeIcons.solidCircleCheck,
                      ),
                    ),
                  ],
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
