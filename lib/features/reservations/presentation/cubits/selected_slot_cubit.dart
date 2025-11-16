import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/time_slot_entity.dart';

class SelectedSlotCubit extends Cubit<TimeSlotEntity?> {
  SelectedSlotCubit() : super(null);

  void update(TimeSlotEntity slot) {
    emit(slot);
  }

  void clear() {
    emit(null);
  }
}
