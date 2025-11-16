part of 'selected_service_options_cubit.dart';

@immutable
final class SelectedServiceOptionsState {
  final List<int> optionIds;
  final int totalAmount;
  final int totalDuration;

  const SelectedServiceOptionsState({
    required this.optionIds,
    required this.totalAmount,
    required this.totalDuration,
  });

  const SelectedServiceOptionsState.initial()
    : optionIds = const [],
      totalAmount = 0,
      totalDuration = 0;
}
