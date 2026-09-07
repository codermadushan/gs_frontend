import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/app_color.dart';
import '../../../../core/constants/app_size.dart';
import '../../../../core/widgets/app_icon_button.dart';
import '../../../../core/widgets/texts.dart';
import '../cubits/pending_reservations/pending_reservations_cubit.dart';
import '../widgets/pending_reservations/pending_reservation_tickets.dart';

class PendingReservationsPage extends StatefulWidget {
  const PendingReservationsPage({super.key});

  @override
  State<PendingReservationsPage> createState() =>
      _PendingReservationsPageState();
}

class _PendingReservationsPageState extends State<PendingReservationsPage> {
  late final PendingReservationsCubit _pendingReservationsCubit;

  Future<void> _loadAllPendingReservations() async {
    _pendingReservationsCubit = context.read<PendingReservationsCubit>();
    _pendingReservationsCubit.loadAllPendingReservations();
  }

  @override
  void initState() {
    super.initState();

    _loadAllPendingReservations();
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
        title: const AppTextH2('Pending'),
        centerTitle: true,
      ),

      body: const PendingReservationTickets(),
    );
  }
}
