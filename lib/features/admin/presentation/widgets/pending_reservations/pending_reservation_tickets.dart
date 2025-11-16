import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/app_router.dart';
import '../../cubits/pending_reservations/pending_reservations_cubit.dart';
import '../admin_reservation_tickets.dart';
import '../admin_reservations_place_holder.dart';

class PendingReservationTickets extends StatefulWidget {
  const PendingReservationTickets({super.key});

  @override
  State<PendingReservationTickets> createState() =>
      _PendingReservationTicketsState();
}

class _PendingReservationTicketsState extends State<PendingReservationTickets> {
  late final PendingReservationsCubit _pendingReservationsCubit;

  Future<void> _loadAllPendingReservations() async {
    await _pendingReservationsCubit.loadAllPendingReservations();
  }

  @override
  void initState() {
    super.initState();

    _pendingReservationsCubit = context.read<PendingReservationsCubit>();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PendingReservationsCubit, PendingReservationsState>(
      buildWhen: (previous, current) {
        if (current is PendingReservationsLoading &&
            current.reservations.isNotEmpty) {
          return false;
        }

        return true;
      },

      builder: (context, state) {
        if (state is PendingReservationsLoading && state.reservations.isEmpty) {
          return const AdminReservationsPlaceHolder(isLoading: true);
        }

        if (state.reservations.isEmpty) {
          return AdminReservationsPlaceHolder(
            emptyMessage: 'No Pending reservations to show at the moment',
            onRefresh: _loadAllPendingReservations,
          );
        }

        return AdminReservationTickets(
          reservations: state.reservations,
          onRefresh: _loadAllPendingReservations,
          navigateOnTap: AppRouter.pendingReservationDetailsPage,
        );
      },
    );
  }
}
