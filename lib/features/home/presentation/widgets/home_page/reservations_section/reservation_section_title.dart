import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/constants/app_size.dart';
import '../../../../../../core/cubits/app_user_reservations/app_user_reservations_cubit.dart';
import '../../../../../../core/widgets/app_icon_button.dart';
import '../../../../../../core/widgets/section_title.dart';

class ReservationSectionTitle extends StatefulWidget {
  const ReservationSectionTitle({super.key});

  @override
  State<ReservationSectionTitle> createState() =>
      _ReservationSectionTitleState();
}

class _ReservationSectionTitleState extends State<ReservationSectionTitle> {
  late final AppUserReservationsCubit _appUserReservationsCubit;

  @override
  void initState() {
    super.initState();

    _appUserReservationsCubit = context.read<AppUserReservationsCubit>();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SectionTitle(
          label: 'My reservations',
          iconData: Icons.calendar_month_rounded,
          padding: EdgeInsets.only(left: AppSize.pagePadding),
        ),

        const Spacer(),

        AppIconButton(
          icon: const Icon(Icons.refresh_rounded),
          onPressed: () {
            _appUserReservationsCubit.loadUserReservations();
          },
        ),

        const SizedBox(width: AppSize.pagePadding),
      ],
    );
  }
}
