import 'package:flutter/material.dart';

import '../../../../core/constants/app_size.dart';
import '../../../../core/enums/status_color.dart';
import '../../../../core/utils/get_status_color.dart';
import '../../../../core/widgets/texts.dart';
import 'pulse_dot.dart';

class StatusMessage extends StatelessWidget {
  final StatusColor _statusColor;
  final String _message;

  const StatusMessage({
    super.key,
    required StatusColor statusColor,
    required String message,
  }) : _statusColor = statusColor,
       _message = message;

  @override
  Widget build(BuildContext context) {
    const dotRadius = 5.0;
    final color = getStatusColor(_statusColor);

    return Row(
      mainAxisSize: .min,
      children: [
        const SizedBox(width: AppSize.pagePadding),

        SizedBox.square(
          dimension: dotRadius * 4,
          child: Center(
            child: PulseDot(color: color, dotRadius: dotRadius),
          ),
        ),

        const SizedBox(width: AppSize.pagePadding),

        Expanded(child: AppTextBody(_message, color: color)),

        const SizedBox(width: AppSize.pagePadding),
      ],
    );
  }
}
