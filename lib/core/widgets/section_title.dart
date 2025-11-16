import 'package:flutter/material.dart';

import '../constants/app_size.dart';
import '../constants/app_style.dart';

class SectionTitle extends StatelessWidget {
  final String _label;
  final IconData _iconData;
  final EdgeInsetsGeometry _padding;

  const SectionTitle({
    super.key,
    required String label,
    required IconData iconData,
    EdgeInsetsGeometry padding = const EdgeInsets.all(0),
  }) : _label = label,
       _iconData = iconData,
       _padding = padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: _padding,
      child: Row(
        children: [
          Icon(_iconData, size: 20),

          const SizedBox(width: AppSize.pagePadding / 2),

          Text(_label, style: AppStyle.h3),
        ],
      ),
    );
  }
}
