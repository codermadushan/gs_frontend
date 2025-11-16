import 'package:flutter/material.dart';

import '../../../../../../core/constants/app_size.dart';
import '../../../../../../core/widgets/app_card.dart';
import '../../../../domain/entities/time_slot_entity.dart';
import 'available_slot.dart';

class AvailableSlots extends StatelessWidget {
  final List<TimeSlotEntity> _slots;

  const AvailableSlots(List<TimeSlotEntity> slots, {super.key})
    : _slots = slots;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      width: double.infinity,
      padding: const EdgeInsets.all(AppSize.pagePadding),

      child: Wrap(
        alignment: WrapAlignment.center,
        spacing: AppSize.pagePadding / 2,
        runSpacing: AppSize.pagePadding / 2,
        children: List.generate(_slots.length, (index) {
          final slot = _slots[index];

          return AvailableSlot(slot);
        }),
      ),
    );
  }
}
