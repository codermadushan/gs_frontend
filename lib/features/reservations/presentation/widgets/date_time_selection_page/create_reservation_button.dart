import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/app_router.dart';
import '../../../../../core/constants/app_size.dart';
import '../../../../../core/cubits/app_user/app_user_cubit.dart';
import '../../../../../core/cubits/app_user_reservations/app_user_reservations_cubit.dart';
import '../../../../../core/enums/user_role.dart';
import '../../../../../core/widgets/app_snack_bar.dart';
import '../../../../../core/widgets/main_button.dart';
import '../../../domain/entities/time_slot_entity.dart';
import '../../cubits/create_reservation/create_reservation_cubit.dart';
import '../../cubits/selected_slot_cubit.dart';

class CreateReservationButton extends StatefulWidget {
  final VoidCallback _onPressed;

  const CreateReservationButton({super.key, required VoidCallback onPressed})
    : _onPressed = onPressed;

  @override
  State<CreateReservationButton> createState() =>
      _CreateReservationButtonState();
}

class _CreateReservationButtonState extends State<CreateReservationButton> {
  late final AppUserReservationsCubit _appUserReservationsCubit;
  late final AppUserCubit _appUserCubit;

  @override
  void initState() {
    super.initState();

    _appUserReservationsCubit = context.read<AppUserReservationsCubit>();

    _appUserCubit = context.read<AppUserCubit>();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SelectedSlotCubit, TimeSlotEntity?>(
      buildWhen: (previous, current) {
        if (previous == null && current != null) return true;

        if (previous != null && current == null) return true;

        return false;
      },
      builder: (context, selectedSlot) {
        return BlocConsumer<CreateReservationCubit, CreateReservationState>(
          listener: (context, createReservationState) {
            if (createReservationState is CreateReservationSuccess) {
              Navigator.popUntil(
                context,
                (route) => route.settings.name == AppRouter.homePage,
              );

              AppSnackBar.success(
                context: context,
                message: 'Reservation is created successfully',
              );

              _appUserReservationsCubit.loadUserReservations();
            } else if (createReservationState is CreateReservationError) {
              AppSnackBar.error(
                context: context,
                message: createReservationState.message,
              );
            }
          },

          buildWhen: (previous, current) {
            if (previous is CreateReservationLoading ||
                current is CreateReservationLoading) {
              return true;
            }

            return false;
          },

          builder: (context, createReservationState) {
            final isLoading =
                createReservationState is CreateReservationLoading;
            final user = (_appUserCubit.state as AppUserSuccess).user;
            final isAdmin = user.role == UserRole.admin;
            final reservations = _appUserReservationsCubit.state.reservations;
            final reservationLimitExceed =
                reservations.length >= AppSize.maxUserReservations;

            return PopScope(
              canPop: !isLoading,
              child: MainButton(
                isDisabled:
                    selectedSlot == null ||
                    (!isAdmin && reservationLimitExceed),
                isLoading: isLoading,
                onPressed: widget._onPressed,
                label: 'Create reservation',
                icon: Icons.chair_rounded,
              ),
            );
          },
        );
      },
    );
  }
}
