import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/constants/app_color.dart';
import '../../../../../../core/entities/service_option_entity.dart';
import '../../../../../../core/widgets/texts.dart';
import '../../../cubits/selected_service_options/selected_service_options_cubit.dart';

class ServiceOption extends StatefulWidget {
  final ServiceOptionEntity _serviceOption;

  const ServiceOption(ServiceOptionEntity serviceOption, {super.key})
    : _serviceOption = serviceOption;

  @override
  State<ServiceOption> createState() => _ServiceOptionState();
}

class _ServiceOptionState extends State<ServiceOption> {
  late final SelectedServiceOptionsCubit _selectedServiceOptionsCubit;

  @override
  void initState() {
    super.initState();

    _selectedServiceOptionsCubit = context.read<SelectedServiceOptionsCubit>();
  }

  @override
  Widget build(BuildContext context) {
    final option = widget._serviceOption;

    return BlocBuilder<
      SelectedServiceOptionsCubit,
      SelectedServiceOptionsState
    >(
      buildWhen: (previous, current) {
        final idInPrevious = previous.optionIds.contains(option.id);
        final idInCurrent = current.optionIds.contains(option.id);

        if (idInPrevious && !idInCurrent) return true;

        if (!idInPrevious && idInCurrent) return true;

        return false;
      },
      builder: (context, state) {
        return SwitchListTile(
          contentPadding: EdgeInsets.zero,
          value: state.optionIds.contains(option.id),
          activeThumbColor: AppColor.primary,
          onChanged: (value) {
            _selectedServiceOptionsCubit.update(
              id: option.id,
              price: option.price,
              duration: option.duration,
              remove: !value,
            );
          },
          title: AppTextH5(option.label, color: AppColor.cardForeground),
          subtitle: AppTextBody(
            'Rs: ${option.price} | ${option.duration} mins',
            color: AppColor.mutedForeground,
          ),
        );
      },
    );
  }
}
