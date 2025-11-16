import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../core/constants/app_color.dart';
import '../../../../../core/cubits/app_user_reservations/app_user_reservations_cubit.dart';
import '../../../../../core/enums/reservation_status.dart';
import '../../../../../core/widgets/app_snack_bar.dart';
import '../../../../../core/widgets/confirmation_dialog.dart';
import '../../../../../core/widgets/main_button.dart';
import '../../cubits/delete_reservation/delete_reservation_cubit.dart';

class ReservationDeleteButton extends StatefulWidget {
  final ReservationStatus _reservationStatus;
  final int _reservationId;

  const ReservationDeleteButton({
    super.key,
    required ReservationStatus reservationStatus,
    required int reservationId,
  }) : _reservationStatus = reservationStatus,
       _reservationId = reservationId;

  @override
  State<ReservationDeleteButton> createState() =>
      _ReservationDeleteButtonState();
}

class _ReservationDeleteButtonState extends State<ReservationDeleteButton> {
  late final DeleteReservationCubit _deleteReservationCubit;
  late final AppUserReservationsCubit _appUserReservationsCubit;

  @override
  void initState() {
    super.initState();

    _deleteReservationCubit = context.read<DeleteReservationCubit>();
    _appUserReservationsCubit = context.read<AppUserReservationsCubit>();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DeleteReservationCubit, DeleteReservationState>(
      listener: (context, state) {
        if (state is DeleteReservationSuccess) {
          Navigator.pop(context);

          _appUserReservationsCubit.loadUserReservations();

          AppSnackBar.success(
            context: context,
            message: 'Reservation is deleted successfully',
          );
        } else if (state is DeleteReservationError) {
          AppSnackBar.error(context: context, message: state.message);
        }
      },
      buildWhen: (previous, current) {
        if (previous is DeleteReservationLoading ||
            current is DeleteReservationLoading) {
          return true;
        }

        return false;
      },
      builder: (context, state) {
        final isLoading = state is DeleteReservationLoading;

        return PopScope(
          canPop: !isLoading,
          child: MainButton(
            backgroundColor: AppColor.destructive,
            foregroundColor: AppColor.foreground,
            isDisabled: widget._reservationStatus == ReservationStatus.accepted,
            isLoading: isLoading,
            onPressed: () async {
              final confirmed = await ConfirmationDialog.show(
                context: context,
                icon: FontAwesomeIcons.trash,
                description:
                    'Are you sure you want to delete this reservation?',
              );

              if (confirmed == null || !confirmed) return;

              _deleteReservationCubit.deleteReservation(widget._reservationId);
            },
            label: 'Delete reservation',
            icon: FontAwesomeIcons.trash,
          ),
        );
      },
    );
  }
}
