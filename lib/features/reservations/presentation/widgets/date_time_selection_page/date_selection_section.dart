import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../../../core/constants/app_color.dart';
import '../../../../../core/constants/app_size.dart';
import '../../../../../core/widgets/app_card.dart';
import '../../../../../core/widgets/app_icon_button.dart';
import '../../../../../core/widgets/section_title.dart';
import '../../../../../core/widgets/texts.dart';
import '../../cubits/available_time_slots/available_time_slots_cubit.dart';
import '../../cubits/selected_date_cubit.dart';
import '../../cubits/selected_service_options/selected_service_options_cubit.dart';
import '../../cubits/selected_slot_cubit.dart';

class DateSelectionSection extends StatefulWidget {
  const DateSelectionSection({super.key});

  @override
  State<DateSelectionSection> createState() => _DateSelectionSectionState();
}

class _DateSelectionSectionState extends State<DateSelectionSection> {
  late final SelectedDateCubit _selectedDateCubit;
  late final AvailableTimeSlotsCubit _availableTimeSlotsCubit;
  late final SelectedServiceOptionsCubit _selectedServiceOptionsCubit;
  late final SelectedSlotCubit _selectedSlotCubit;

  @override
  void initState() {
    super.initState();

    _selectedDateCubit = context.read<SelectedDateCubit>();
    _availableTimeSlotsCubit = context.read<AvailableTimeSlotsCubit>();
    _selectedServiceOptionsCubit = context.read<SelectedServiceOptionsCubit>();
    _selectedSlotCubit = context.read<SelectedSlotCubit>();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SectionTitle(
          label: 'Select date',
          iconData: Icons.calendar_month_rounded,
        ),

        const SizedBox(height: AppSize.gapSmall),

        AppCard(
          padding: const EdgeInsets.all(AppSize.pagePadding),
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children: [
              BlocBuilder<SelectedDateCubit, DateTime>(
                builder: (context, state) {
                  return AppTextH5(
                    DateFormat('MMMM d, yyyy').format(state),
                    color: AppColor.primary,
                  );
                },
              ),

              BlocListener<SelectedDateCubit, DateTime>(
                listener: (context, state) {
                  // Clear already selected time slot
                  _selectedSlotCubit.clear();

                  // Reload available slots when select a new date
                  _availableTimeSlotsCubit.loadAvailableTimeSlots(
                    serviceIds: _selectedServiceOptionsCubit.state.optionIds,
                    isoDateString: state.toUtc().toIso8601String(),
                  );
                },
                child: AppIconButton(
                  icon: const Icon(Icons.calendar_month_rounded),
                  onPressed: () async {
                    final now = DateTime.now();

                    final date = await showDatePicker(
                      context: context,
                      firstDate: now,
                      lastDate: now.add(const Duration(days: 90)),
                    );

                    if (date == null) return;

                    _selectedDateCubit.updateDate(date);
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
