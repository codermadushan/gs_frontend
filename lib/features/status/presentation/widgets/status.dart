import 'package:flutter/material.dart';

import '../../../../core/enums/status_color.dart';
import 'status_message.dart';
import 'status_message_place_holder.dart';

class Status extends StatelessWidget {
  const Status({super.key});

  @override
  Widget build(BuildContext context) {
    const isLoaded = false;

    if (isLoaded) {
      return const StatusMessage(
        statusColor: StatusColor.muted,
        message: 'Currently open',
      );
    }

    return const StatusMessagePlaceHolder();
  }
}
