import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/widgets/main_button.dart';
import '../../cubits/selected_service_options/selected_service_options_cubit.dart';

class ServiceSelectionNextButton extends StatelessWidget {
  final VoidCallback _onPressed;

  const ServiceSelectionNextButton({super.key, required VoidCallback onPressed})
    : _onPressed = onPressed;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<
      SelectedServiceOptionsCubit,
      SelectedServiceOptionsState
    >(
      buildWhen: (previous, current) {
        if (previous.optionIds.isEmpty && current.optionIds.isNotEmpty) {
          return true;
        }

        if (previous.optionIds.isNotEmpty && current.optionIds.isEmpty) {
          return true;
        }

        return false;
      },
      builder: (context, state) {
        return MainButton(
          label: 'Next',
          isDisabled: state.optionIds.isEmpty,
          icon: Icons.arrow_forward_rounded,
          onPressed: _onPressed,
        );
      },
    );
  }
}
