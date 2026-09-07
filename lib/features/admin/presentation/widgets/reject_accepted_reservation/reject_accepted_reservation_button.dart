import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/app_router.dart';
import '../../../../../core/constants/app_color.dart';
import '../../../../../core/widgets/app_snack_bar.dart';
import '../../../../../core/widgets/main_button.dart';
import '../../cubits/accepted_reservations/accepted_reservations_cubit.dart';
import '../../cubits/update_reservation_status/update_reservation_status_cubit.dart';

class RejectAcceptedReservationButton extends StatefulWidget {
  final VoidCallback _onPressed;

  const RejectAcceptedReservationButton({
    super.key,
    required VoidCallback onPressed,
  }) : _onPressed = onPressed;

  @override
  State<RejectAcceptedReservationButton> createState() =>
      _RejectAcceptedReservationButtonState();
}

class _RejectAcceptedReservationButtonState
    extends State<RejectAcceptedReservationButton> {
  late final AcceptedReservationsCubit _acceptedReservationsCubit;

  @override
  void initState() {
    super.initState();

    _acceptedReservationsCubit = context.read<AcceptedReservationsCubit>();
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
            (route) =>
                route.settings.name == AppRouter.acceptedReservationsPage,
          );

          _acceptedReservationsCubit.loadAllAcceptedReservations();

          AppSnackBar.success(
            context: context,
            message: 'Reservation is rejected successfully',
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
            foregroundColor: AppColor.foreground,
            backgroundColor: AppColor.destructive,
            label: 'Reject',
            icon: Icons.cancel_outlined,
            isLoading: isLoading,

            onPressed: widget._onPressed,
          ),
        );
      },
    );
  }
}
