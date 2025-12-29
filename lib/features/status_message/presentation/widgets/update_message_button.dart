import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../core/enums/status_message_color.dart';
import '../../../../core/widgets/app_snack_bar.dart';
import '../../../../core/widgets/main_button.dart';
import '../../domain/usecases/update_status_message.dart';
import '../cubits/get_status_message/get_status_message_cubit.dart';
import '../cubits/new_status_message_cubit.dart';
import '../cubits/selected_message_color_cubit.dart';
import '../cubits/update_status_message/update_status_message_cubit.dart';

class UpdateMessageButton extends StatefulWidget {
  const UpdateMessageButton({super.key});

  @override
  State<UpdateMessageButton> createState() => _UpdateMessageButtonState();
}

class _UpdateMessageButtonState extends State<UpdateMessageButton> {
  late final UpdateStatusMessageCubit _updateStatusMessageCubit;
  late final SelectedMessageColorCubit _selectedMessageColorCubit;
  late final NewStatusMessageCubit _newStatusMessageCubit;
  late final GetStatusMessageCubit _getStatusMessageCubit;

  @override
  void initState() {
    super.initState();

    _updateStatusMessageCubit = context.read<UpdateStatusMessageCubit>();
    _selectedMessageColorCubit = context.read<SelectedMessageColorCubit>();
    _newStatusMessageCubit = context.read<NewStatusMessageCubit>();
    _getStatusMessageCubit = context.read<GetStatusMessageCubit>();
  }

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

            return BlocConsumer<
              UpdateStatusMessageCubit,
              UpdateStatusMessageState
            >(
              listener: (context, state) {
                if (state is UpdateStatusMessageError) {
                  AppSnackBar.error(context: context, message: state.message);
                } else if (state is UpdateStatusMessageSuccess) {
                  Navigator.pop(context);

                  _getStatusMessageCubit.start();

                  AppSnackBar.success(
                    context: context,
                    message: "Note is updated successfully",
                  );
                }
              },

              builder: (context, state) {
                final isLoading = state is UpdateStatusMessageLoading;

                return PopScope(
                  canPop: !isLoading,
                  child: MainButton(
                    onPressed: () {
                      _updateStatusMessageCubit.start(
                        UpdateStatusMessageParams(
                          message: _newStatusMessageCubit.state,
                          color: _selectedMessageColorCubit.state!.label,
                        ),
                      );
                    },
                    label: 'Update note',
                    icon: FontAwesomeIcons.arrowRotateRight,
                    isDisabled: !isActive,
                    isLoading: isLoading,
                  ),
                );
              },
            );
          },
        );
      },
    );
  }
}
