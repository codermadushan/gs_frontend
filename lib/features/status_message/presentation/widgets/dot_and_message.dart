import 'package:flutter/material.dart';

import '../../../../core/constants/app_size.dart';
import '../../../../core/widgets/app_card.dart';
import '../../../../core/widgets/texts.dart';
import 'pulse_dot.dart';

class DotAndMessage extends StatelessWidget {
  final Color _color;
  final String _message;

  const DotAndMessage({
    super.key,
    required Color color,
    required String message,
  }) : _color = color,
       _message = message;

  @override
  Widget build(BuildContext context) {
    const dotRadius = 5.0;

    return AppCard(
      margin: const EdgeInsets.symmetric(horizontal: AppSize.pagePadding),

      padding: const EdgeInsets.all(AppSize.pagePadding),

      child: Row(
        children: [
          SizedBox.square(
            dimension: dotRadius * 4,
            child: Center(
              child: PulseDot(color: _color, dotRadius: dotRadius),
            ),
          ),

          const SizedBox(width: AppSize.pagePadding),

          Expanded(child: AppTextBody(_message, color: _color)),
        ],
      ),
    );
  }
}
