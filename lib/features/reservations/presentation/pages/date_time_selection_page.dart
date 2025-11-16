import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/app_size.dart';
import '../../domain/usecases/create_reservation.dart';
import '../cubits/available_time_slots/available_time_slots_cubit.dart';
import '../cubits/create_reservation/create_reservation_cubit.dart';
import '../cubits/selected_date_cubit.dart';
import '../cubits/selected_service_options/selected_service_options_cubit.dart';
import '../cubits/selected_slot_cubit.dart';
import '../models/reservation_data.dart';
import '../widgets/date_time_selection_page/available_slots_section/available_slots_section.dart';
import '../widgets/date_time_selection_page/create_reservation_button.dart';
import '../widgets/date_time_selection_page/date_selection_section.dart';
import '../widgets/date_time_selection_page/date_time_selection_app_bar.dart';

class DateTimeSelectionPage extends StatefulWidget {
  const DateTimeSelectionPage({super.key});

  @override
  State<DateTimeSelectionPage> createState() => _DateTimeSelectionPageState();
}

class _DateTimeSelectionPageState extends State<DateTimeSelectionPage> {
  late final ReservationData _reservationData;

  late final AvailableTimeSlotsCubit _availableTimeSlotsCubit;
  late final SelectedDateCubit _selectedDateCubit;
  late final SelectedServiceOptionsCubit _selectedServiceOptionsCubit;
  late final SelectedSlotCubit _selectedSlotCubit;
  late final CreateReservationCubit _createReservationCubit;

  void _clearSelectedSlot() {
    _selectedSlotCubit = context.read<SelectedSlotCubit>();
    _selectedSlotCubit.clear();
  }

  void _loadAvailableTimeSlots() {
    _selectedDateCubit = context.read<SelectedDateCubit>();

    _selectedServiceOptionsCubit = context.read<SelectedServiceOptionsCubit>();

    _availableTimeSlotsCubit = context.read<AvailableTimeSlotsCubit>();
    _availableTimeSlotsCubit.loadAvailableTimeSlots(
      serviceIds: _selectedServiceOptionsCubit.state.optionIds,
      isoDateString: _selectedDateCubit.state.toUtc().toIso8601String(),
    );
  }

  @override
  void initState() {
    super.initState();

    _clearSelectedSlot();

    _loadAvailableTimeSlots();

    _createReservationCubit = context.read<CreateReservationCubit>();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _reservationData =
        ModalRoute.settingsOf(context)!.arguments as ReservationData;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DateTimeSelectionAppBar(),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppSize.pagePadding),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: AppSize.gapLarge),

                const DateSelectionSection(),

                const SizedBox(height: AppSize.gapLarge),

                const AvailableSlotsSection(),

                const SizedBox(height: AppSize.gapLarge),

                CreateReservationButton(
                  onPressed: () {
                    final params = CreateReservationParams(
                      optionIds: _selectedServiceOptionsCubit.state.optionIds,
                      additionalInfo: _reservationData.additionalInfo,
                      barberId: _reservationData.barberId,
                      date: _selectedDateCubit.state.toUtc().toIso8601String(),
                      startAt: _selectedSlotCubit.state!.startAt
                          .toUtc()
                          .toIso8601String(),
                      endAt: _selectedSlotCubit.state!.endAt
                          .toUtc()
                          .toIso8601String(),
                    );

                    _createReservationCubit.createReservation(params);
                  },
                ),

                const SizedBox(height: AppSize.gapLarge),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
