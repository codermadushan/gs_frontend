import 'package:flutter/material.dart';

import 'app_color.dart';

const _defaultTextColor = AppColor.foreground;

sealed class AppStyle {
  static const h1 = TextStyle(
    fontSize: 30,
    letterSpacing: -0.025 * 30,
    height: 1.25,
    fontWeight: FontWeight.w800,
    color: _defaultTextColor,
  );

  static const h2 = TextStyle(
    fontSize: 24,
    letterSpacing: -0.025 * 24,
    height: 1.25,
    fontWeight: FontWeight.w700,
    color: _defaultTextColor,
  );

  static const h3 = TextStyle(
    fontSize: 20,
    letterSpacing: 0,
    height: 1.375,
    fontWeight: FontWeight.w600,
    color: _defaultTextColor,
  );

  static const h4 = TextStyle(
    fontSize: 18,
    letterSpacing: 0,
    height: 1.375,
    fontWeight: FontWeight.w600,
    color: _defaultTextColor,
  );

  static const h5 = TextStyle(
    fontSize: 16,
    letterSpacing: 0,
    height: 1.5,
    fontWeight: FontWeight.w500,
    color: _defaultTextColor,
  );

  static const h6 = TextStyle(
    fontSize: 14,
    letterSpacing: 0.025 * 14,
    height: 1.5,
    fontWeight: FontWeight.w500,
    color: _defaultTextColor,
  );

  static const body = TextStyle(fontSize: 14, color: _defaultTextColor);
}
