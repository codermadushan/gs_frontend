import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/app_router.dart';
import '../../../../core/constants/app_color.dart';
import '../../../../core/constants/app_size.dart';
import '../../../../core/widgets/app_icon_button.dart';
import '../../../../core/widgets/texts.dart';
import '../cubits/accepted_reservations/accepted_reservations_cubit.dart';
import '../widgets/accepted_reservations/accepted_reservation_tickets.dart';

class AcceptedReservationsPage extends StatefulWidget {
  const AcceptedReservationsPage({super.key});

  @override
  State<AcceptedReservationsPage> createState() =>
      _AcceptedReservationsPageState();
}

class _AcceptedReservationsPageState extends State<AcceptedReservationsPage> {
  late final AcceptedReservationsCubit _acceptedReservationsCubit;

  void _loadAllAcceptedReservations() {
    _acceptedReservationsCubit = context.read<AcceptedReservationsCubit>();
    _acceptedReservationsCubit.loadAllAcceptedReservations();
  }

  @override
  void initState() {
    super.initState();

    _loadAllAcceptedReservations();
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
              icon: const Icon(Icons.arrow_back_ios_rounded),
              onPressed: () async {
                await Navigator.maybePop(context);
              },
            ),
          ),
        ),
        title: const AppTextH2('Accepted'),
        centerTitle: false,

        actionsPadding: const EdgeInsets.only(right: AppSize.pagePadding),
        actions: [
          AppIconButton(
            icon: const Icon(Icons.sms_rounded),
            onPressed: () async {
              await Navigator.pushNamed(context, AppRouter.updateMessagePage);
            },
          ),

          const SizedBox(width: AppSize.pagePadding),

          AppIconButton(
            icon: const Icon(Icons.pending_rounded),
            onPressed: () async {
              await Navigator.pushNamed(
                context,
                AppRouter.pendingReservationsPage,
              );
            },
          ),
        ],
      ),

      body: const AcceptedReservationTickets(),
    );
  }
}
