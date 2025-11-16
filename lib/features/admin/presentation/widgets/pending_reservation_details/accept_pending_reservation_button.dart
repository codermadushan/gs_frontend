import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../core/app_router.dart';
import '../../../../../core/constants/app_color.dart';
import '../../../../../core/enums/reservation_status.dart';
import '../../../../../core/widgets/app_snack_bar.dart';
import '../../../../../core/widgets/confirmation_dialog.dart';
import '../../../../../core/widgets/main_button.dart';
import '../../cubits/accepted_reservations/accepted_reservations_cubit.dart';
import '../../cubits/pending_reservations/pending_reservations_cubit.dart';
import '../../cubits/update_reservation_status/update_reservation_status_cubit.dart';

class AcceptPendingReservationButton extends StatefulWidget {
  final int _reservationId;

  const AcceptPendingReservationButton(int reservationId, {super.key})
    : _reservationId = reservationId;

  @override
  State<AcceptPendingReservationButton> createState() =>
      _AcceptPendingReservationButtonState();
}

class _AcceptPendingReservationButtonState
    extends State<AcceptPendingReservationButton> {
  late final UpdateReservationStatusCubit _updateReservationStatusCubit;
  late final AcceptedReservationsCubit _acceptedReservationsCubit;
  late final PendingReservationsCubit _pendingReservationsCubit;

  @override
  void initState() {
    super.initState();

    _updateReservationStatusCubit = context
        .read<UpdateReservationStatusCubit>();
    _acceptedReservationsCubit = context.read<AcceptedReservationsCubit>();
    _pendingReservationsCubit = context.read<PendingReservationsCubit>();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<
      UpdateReservationStatusCubit,
      UpdateReservationStatusState
    >(
      listener: (context, state) {
        if (state is UpdateReservationStatusError) {
          AppSnackBar.error(context: context, message: state.message);
        } else if (state is UpdateReservationStatusSuccess) {
          Navigator.popUntil(
            context,
            (route) => route.settings.name == AppRouter.pendingReservationsPage,
          );

          _pendingReservationsCubit.loadAllPendingReservations();

          _acceptedReservationsCubit.loadAllAcceptedReservations();

          AppSnackBar.success(
            context: context,
            message: 'Reservation is accepted successfully',
          );
        }
      },

      buildWhen: (previous, current) {
        if (previous is UpdateReservationStatusLoading ||
            current is UpdateReservationStatusLoading) {
          return true;
        }

        return false;
      },

      builder: (context, state) {
        final isLoading = state is UpdateReservationStatusLoading;

        return PopScope(
          canPop: !isLoading,
          child: MainButton(
            isLoading: isLoading,
            foregroundColor: AppColor.foreground,
            backgroundColor: AppColor.success,
            label: 'Accept',
            icon: FontAwesomeIcons.solidCircleCheck,

            onPressed: () async {
              final confirmed = await ConfirmationDialog.show(
                context: context,
                description:
                    'Are you sure you want to accept this reservation?',
                iconColor: AppColor.success,
                icon: FontAwesomeIcons.solidCircleCheck,
              );

              if (confirmed == null || !confirmed) return;

              _updateReservationStatusCubit.updateReservationStatusParams(
                reservationId: widget._reservationId,
                status: ReservationStatus.accepted,
              );
            },
          ),
        );
      },
    );
  }
}
