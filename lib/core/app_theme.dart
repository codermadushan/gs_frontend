import 'package:flutter/material.dart';

import 'constants/app_color.dart';

sealed class AppTheme {
  static final dark = ThemeData.dark().copyWith(
    colorScheme: ColorScheme.fromSeed(
      brightness: Brightness.dark,
      seedColor: AppColor.primary,
    ),

    scaffoldBackgroundColor: AppColor.background,

    appBarTheme: const AppBarTheme(
      backgroundColor: AppColor.background,
      foregroundColor: AppColor.foreground,
      centerTitle: true,
      scrolledUnderElevation: 0,
    ),
  );
}
