import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../../core/cubits/app_barbers/app_barbers_cubit.dart';
import '../../../../../../core/widgets/section_title.dart';
import '../../../../../../core/constants/app_size.dart';
import 'barber_list.dart';
import 'barber_list_place_holder.dart';

class BarbersSection extends StatelessWidget {
  const BarbersSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SectionTitle(
          label: 'Barbers',
          iconData: FontAwesomeIcons.person,
          padding: EdgeInsets.only(left: AppSize.pagePadding),
        ),

        const SizedBox(height: AppSize.gapSmall),

        BlocBuilder<AppBarbersCubit, AppBarbersState>(
          builder: (context, state) {
            if (state.barbers.isEmpty) {
              return const BarberListPlaceHolder();
            }

            return BarberList(state.barbers);
          },
        ),

        // BarberListPlaceHolder(),
      ],
    );
  }
}
