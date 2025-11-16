import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/app_router.dart';
import '../../cubits/accepted_reservations/accepted_reservations_cubit.dart';
import '../admin_reservation_tickets.dart';
import '../admin_reservations_place_holder.dart';

class AcceptedReservationTickets extends StatefulWidget {
  const AcceptedReservationTickets({super.key});

  @override
  State<AcceptedReservationTickets> createState() =>
      _AcceptedReservationTicketsState();
}

class _AcceptedReservationTicketsState
    extends State<AcceptedReservationTickets> {
  late final AcceptedReservationsCubit _acceptedReservationsCubit;

  Future<void> _refreshAcceptedReservations() async {
    await _acceptedReservationsCubit.loadAllAcceptedReservations();
  }

  @override
  void initState() {
    super.initState();

    _acceptedReservationsCubit = context.read<AcceptedReservationsCubit>();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AcceptedReservationsCubit, AcceptedReservationsState>(
      buildWhen: (previous, current) {
        if (current is AcceptedReservationsLoading &&
            current.reservations.isNotEmpty) {
          return false;
        }

        return true;
      },

      builder: (context, state) {
        if (state is AcceptedReservationsLoading &&
            state.reservations.isEmpty) {
          return const AdminReservationsPlaceHolder(isLoading: true);
        }

        if (state.reservations.isEmpty) {
          return AdminReservationsPlaceHolder(
            emptyMessage: 'No accepted reservations to show at the moment',
            onRefresh: _refreshAcceptedReservations,
          );
        }

        return AdminReservationTickets(
          reservations: state.reservations,
          navigateOnTap: AppRouter.acceptedReservationDetailsPage,
          onRefresh: _refreshAcceptedReservations,
        );
      },
    );
  }
}
