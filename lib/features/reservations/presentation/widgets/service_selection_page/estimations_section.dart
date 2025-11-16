import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/constants/app_color.dart';
import '../../../../../core/constants/app_style.dart';
import '../../cubits/selected_service_options/selected_service_options_cubit.dart';

String _getReadableDuration(int duration) {
  final minutes = duration % 60;
  final hours = duration ~/ 60;

  if (hours == 0 && minutes == 0) return 'not available';

  if (hours == 0) return '$minutes minute${minutes == 1 ? '' : 's'}';

  if (minutes == 0) return '$hours hour${hours == 1 ? '' : 's'}';

  return '$hours hour${hours == 1 ? '' : 's'} and $minutes minute${minutes == 1 ? '' : 's'}';
}

String _getReadablePrice(int price) {
  if (price == 0) return 'not available';

  return 'Rs: $price+';
}

class EstimationsSection extends StatelessWidget {
  const EstimationsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<
      SelectedServiceOptionsCubit,
      SelectedServiceOptionsState
    >(
      builder: (context, state) {
        return RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            text: 'Estimated price for the session is ',
            style: AppStyle.h5,

            children: [
              TextSpan(
                text: _getReadablePrice(state.totalAmount),
                style: const TextStyle(color: AppColor.destructive),
              ),

              const TextSpan(text: ' and session duration is '),

              TextSpan(
                text: _getReadableDuration(state.totalDuration),
                style: const TextStyle(color: AppColor.primary),
              ),

              if (state.totalAmount != 0)
                const TextSpan(
                  text: ' (Pricing subject to change based on final scope)',
                  style: TextStyle(color: AppColor.destructive),
                ),
            ],
          ),
        );
      },
    );
  }
}
