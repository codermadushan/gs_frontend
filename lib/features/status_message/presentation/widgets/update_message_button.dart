import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../core/enums/status_message_color.dart';
import '../../../../core/widgets/main_button.dart';
import '../cubits/new_status_message_cubit.dart';
import '../cubits/selected_message_color_cubit.dart';

class UpdateMessageButton extends StatelessWidget {
  const UpdateMessageButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SelectedMessageColorCubit, StatusMessageColor?>(
      buildWhen: (previous, current) {
        if (previous == null || current == null) return true;

        return false;
      },
      builder: (context, statusMessageColor) {
        return BlocBuilder<NewStatusMessageCubit, String>(
          buildWhen: (previous, current) {
            if (previous.isEmpty || current.isEmpty) return true;

            return false;
          },
          builder: (context, newStatusMessage) {
            final isActive =
                statusMessageColor != null && newStatusMessage.isNotEmpty;

            return MainButton(
              onPressed: () {},
              label: 'Update note',
              icon: FontAwesomeIcons.arrowRotateRight,
              isDisabled: !isActive,
            );
          },
        );
      },
    );
  }
}
