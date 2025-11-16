import 'package:flutter/foundation.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

part 'selected_service_options_state.dart';

class SelectedServiceOptionsCubit extends Cubit<SelectedServiceOptionsState> {
  SelectedServiceOptionsCubit()
    : super(const SelectedServiceOptionsState.initial());

  void update({
    required int id,
    required int price,
    required int duration,
    bool remove = false,
  }) {
    List<int> optionIds;
    int totalAmount;
    int totalDuration;

    if (remove) {
      optionIds = [...state.optionIds]..remove(id);
      totalAmount = state.totalAmount - price;
      totalDuration = state.totalDuration - duration;
    } else {
      optionIds = [...state.optionIds, id];
      totalAmount = state.totalAmount + price;
      totalDuration = state.totalDuration + duration;
    }

    emit(
      SelectedServiceOptionsState(
        optionIds: optionIds,
        totalAmount: totalAmount,
        totalDuration: totalDuration,
      ),
    );
  }

  void clear() {
    emit(const SelectedServiceOptionsState.initial());
  }
}
