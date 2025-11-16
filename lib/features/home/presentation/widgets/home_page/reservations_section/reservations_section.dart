import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/constants/app_size.dart';
import '../../../../../../core/cubits/app_user_reservations/app_user_reservations_cubit.dart';
import 'reservation_list.dart';
import 'reservation_list_place_holder.dart';
import 'reservation_section_title.dart';

class ReservationsSection extends StatelessWidget {
  const ReservationsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const ReservationSectionTitle(),

        const SizedBox(height: AppSize.gapSmall),

        BlocBuilder<AppUserReservationsCubit, AppUserReservationsState>(
          buildWhen: (previous, current) {
            if (previous is AppUserReservationsLoading ||
                current is AppUserReservationsLoading) {
              return true;
            }

            return false;
          },
          builder: (context, state) {
            if (state is AppUserReservationsLoading) {
              return const ReservationListPlaceHolder(isLoading: true);
            }

            if (state.reservations.isEmpty) {
              return const ReservationListPlaceHolder();
            }

            return ReservationList(state.reservations);
          },
        ),
      ],
    );
  }
}
