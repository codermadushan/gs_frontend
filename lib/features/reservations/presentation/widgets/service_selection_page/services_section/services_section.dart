import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/constants/app_size.dart';
import '../../../../../../core/cubits/app_barber_services/app_barber_services_cubit.dart';
import '../../../../../../core/widgets/app_card.dart';
import '../../../../../../core/widgets/section_title.dart';
import 'service_categories.dart';
import 'services_place_holder.dart';

class ServicesSection extends StatelessWidget {
  const ServicesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionTitle(
          label: 'Services',
          iconData: Icons.content_cut_rounded,
        ),

        const SizedBox(height: AppSize.gapSmall),

        BlocBuilder<AppBarberServicesCubit, AppBarberServicesState>(
          buildWhen: (previous, current) {
            if (previous is AppBarberServicesLoading ||
                current is AppBarberServicesLoading) {
              return true;
            }

            return false;
          },
          builder: (context, state) {
            if (state is AppBarberServicesLoading) {
              return const ServicesPlaceHolder(isLoading: true);
            }

            if (state.services.isEmpty) {
              return const ServicesPlaceHolder();
            }

            return AppCard(
              padding: const EdgeInsets.all(AppSize.pagePadding),
              width: double.infinity,
              child: ServiceCategories(state.services),
            );
          },
        ),
      ],
    );
  }
}
