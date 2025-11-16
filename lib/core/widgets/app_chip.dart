import 'package:flutter/material.dart';

import '../constants/app_color.dart';
import '../constants/app_size.dart';

class AppChip extends StatelessWidget {
  final bool _selected;
  final void Function(bool)? _onSelected;
  final String _label;

  const AppChip({
    super.key,
    required String label,
    bool selected = false,
    void Function(bool)? onSelected,
  }) : _label = label,
       _selected = selected,
       _onSelected = onSelected;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSize.chipHeight,
      child: ChoiceChip(
        label: Text(
          _label,
          style: TextStyle(
            color: _selected
                ? AppColor.primaryForeground
                : AppColor.mutedForeground,
          ),
        ),
        selectedColor: AppColor.primary,
        backgroundColor: AppColor.muted,
        checkmarkColor: AppColor.primaryForeground,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(8),
          side: BorderSide(
            color: _selected ? AppColor.primary : AppColor.border,
          ),
        ),
        onSelected: _onSelected,
        selected: _selected,
      ),
    );
  }
}
