import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/app_size.dart';
import '../../../../core/enums/status_message_color.dart';
import '../cubits/selected_message_color_cubit.dart';
import 'color_circle.dart';

class ColorCircles extends StatefulWidget {
  const ColorCircles({super.key});

  @override
  State<ColorCircles> createState() => _ColorCirclesState();
}

class _ColorCirclesState extends State<ColorCircles> {
  late final SelectedMessageColorCubit _selectedMessageColorCubit;

  @override
  void initState() {
    super.initState();

    _selectedMessageColorCubit = context.read<SelectedMessageColorCubit>();
    _selectedMessageColorCubit.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: .center,

      spacing: AppSize.pagePadding,

      children: List.generate(StatusMessageColor.values.length, (index) {
        return BlocBuilder<SelectedMessageColorCubit, StatusMessageColor?>(
          builder: (context, state) {
            return ColorCircle(
              color: StatusMessageColor.values[index],
              selectedColor: state,

              updateSelectedColor: (selectedColor) {
                _selectedMessageColorCubit.updateSelectedColor(selectedColor);
              },
            );
          },
        );
      }),
    );
  }
}
