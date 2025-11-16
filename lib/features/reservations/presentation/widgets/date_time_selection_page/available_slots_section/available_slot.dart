import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../../../../core/widgets/app_chip.dart';
import '../../../../domain/entities/time_slot_entity.dart';
import '../../../cubits/selected_slot_cubit.dart';

class AvailableSlot extends StatefulWidget {
  final TimeSlotEntity _slot;

  const AvailableSlot(TimeSlotEntity slot, {super.key}) : _slot = slot;

  @override
  State<AvailableSlot> createState() => _AvailableSlotState();
}

class _AvailableSlotState extends State<AvailableSlot> {
  static const _dateFormat = 'h:mma';

  late final SelectedSlotCubit _selectedSlotCubit;

  @override
  void initState() {
    super.initState();

    _selectedSlotCubit = context.read<SelectedSlotCubit>();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SelectedSlotCubit, TimeSlotEntity?>(
      buildWhen: (previous, current) {
        if (current != null && current.id == widget._slot.id) return true;

        if (previous != null &&
            previous.id == widget._slot.id &&
            current != null &&
            current.id != widget._slot.id) {
          return true;
        }

        return false;
      },
      builder: (context, state) {
        return AppChip(
          label:
              '${DateFormat(_dateFormat).format(widget._slot.startAt)} - ${DateFormat(_dateFormat).format(widget._slot.endAt)}',
          selected: state == null ? false : state.id == widget._slot.id,
          onSelected: (_) {
            _selectedSlotCubit.update(widget._slot);
          },
        );
      },
    );
  }
}
