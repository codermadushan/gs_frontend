import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/get_status_message/get_status_message_cubit.dart';
import 'dot_and_message.dart';
import 'status_message_place_holder.dart';

class StatusMessage extends StatefulWidget {
  const StatusMessage({super.key});

  @override
  State<StatusMessage> createState() => _StatusMessageState();
}

class _StatusMessageState extends State<StatusMessage> {
  late final GetStatusMessageCubit _getStatusMessageCubit;

  @override
  void initState() {
    super.initState();

    _getStatusMessageCubit = context.read<GetStatusMessageCubit>();
    _getStatusMessageCubit.load();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetStatusMessageCubit, GetStatusMessageState>(
      builder: (context, state) {
        if (state is GetStatusMessageLoaded) {
          final statusMessage = state.statusMessage;

          return DotAndMessage(
            color: statusMessage.color,
            message: statusMessage.message,
          );
        }

        return const StatusMessagePlaceHolder();
      },
    );
  }
}
