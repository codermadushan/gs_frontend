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
import '../widgets/pending_reservation_details/accept_pending_reservation_button.dart';

class PendingReservationDetailsPage extends StatefulWidget {
  const PendingReservationDetailsPage({super.key});

  @override
  State<PendingReservationDetailsPage> createState() =>
      _PendingReservationDetailsPageState();
}

class _PendingReservationDetailsPageState
    extends State<PendingReservationDetailsPage> {
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
                  children: [
                    Expanded(
                      child: MainButton(
                        foregroundColor: AppColor.foreground,
                        backgroundColor: AppColor.destructive,
                        label: 'Reject',
                        icon: FontAwesomeIcons.solidCircleXmark,

                        onPressed: () async {
                          await Navigator.pushNamed(
                            context,
                            AppRouter.rejectPendingReservationPage,
                            arguments: _reservation.id,
                          );
                        },
                      ),
                    ),

                    const SizedBox(width: AppSize.pagePadding),

                    Expanded(
                      child: AcceptPendingReservationButton(_reservation.id),
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
