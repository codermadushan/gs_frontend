import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../../core/constants/app_size.dart';
import '../../../../../../core/widgets/section_title.dart';
import '../../../cubits/available_time_slots/available_time_slots_cubit.dart';
import 'available_slots.dart';
import 'available_slots_place_holder.dart';

class AvailableSlotsSection extends StatelessWidget {
  const AvailableSlotsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SectionTitle(
          label: 'Select time',
          iconData: FontAwesomeIcons.alarmClock,
        ),

        const SizedBox(height: AppSize.gapSmall),

        // AvailableSlotsPlaceHolder(),
        BlocBuilder<AvailableTimeSlotsCubit, AvailableTimeSlotsState>(
          builder: (context, state) {
            if (state is AvailableTimeSlotsLoading) {
              return const AvailableSlotsPlaceHolder(isLoading: true);
            }

            if (state.slots.isEmpty) {
              return const AvailableSlotsPlaceHolder();
            }

            return AvailableSlots(state.slots);
          },
        ),
      ],
    );
  }
}
