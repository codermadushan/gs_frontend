import 'package:flutter/material.dart';

sealed class AppColor {
  // Background colors
  static const Color background = Color(0xFF09090B);
  static const Color foreground = Color(0xFFFAFAFA);

  // Card colors
  static const Color card = Color(0xFF18181B);
  static const Color cardForeground = Color(0xFFFAFAFA);

  // Popover colors
  static const Color popover = Color(0xFF18181B);
  static const Color popoverForeground = Color(0xFFFAFAFA);

  // Primary colors
  static const Color primary = Color(0xFFF0B100);
  static const Color primaryForeground = Color(0xFF733E0A);

  // Secondary colors
  static const Color secondary = Color(0xFF27272A);
  static const Color secondaryForeground = Color(0xFFFAFAFA);

  // Muted colors
  static const Color muted = Color(0xFF27272A);
  static const Color mutedForeground = Color(0xFF9F9FA9);

  // Accent colors
  static const Color accent = Color(0xFF27272A);
  static const Color accentForeground = Color(0xFFFAFAFA);

  // Destructive colors
  static const Color destructive = Color(0xFFFF6467);

  // Border and input colors (with transparency)
  static const Color border = Color(0x1AFFFFFF);
  static const Color input = Color(0x26FFFFFF);

  // Ring color
  static const Color ring = Color(0xFFA65F00);

  // Chart colors
  static const Color chart1 = Color(0xFF1447E6);
  static const Color chart2 = Color(0xFF00BC7D);
  static const Color chart3 = Color(0xFFFE9A00);
  static const Color chart4 = Color(0xFFAD46FF);
  static const Color chart5 = Color(0xFFFF2056);

  // Sidebar colors
  static const Color sidebar = Color(0xFF18181B);
  static const Color sidebarForeground = Color(0xFFFAFAFA);
  static const Color sidebarPrimary = Color(0xFFF0B100);
  static const Color sidebarPrimaryForeground = Color(0xFF733E0A);
  static const Color sidebarAccent = Color(0xFF27272A);
  static const Color sidebarAccentForeground = Color(0xFFFAFAFA);
  static const Color sidebarBorder = Color(0x1AFFFFFF);
  static const Color sidebarRing = Color(0xFFA65F00);

  // custom
  static const success = Color(0xFF00C896);
}

//   --radius: 0.65rem;
//   --background: oklch(0.141 0.005 285.823);
//   --foreground: oklch(0.985 0 0);
//   --card: oklch(0.21 0.006 285.885);
//   --card-foreground: oklch(0.985 0 0);
//   --popover: oklch(0.21 0.006 285.885);
//   --popover-foreground: oklch(0.985 0 0);
//   --primary: oklch(0.795 0.184 86.047);
//   --primary-foreground: oklch(0.421 0.095 57.708);
//   --secondary: oklch(0.274 0.006 286.033);
//   --secondary-foreground: oklch(0.985 0 0);
//   --muted: oklch(0.274 0.006 286.033);
//   --muted-foreground: oklch(0.705 0.015 286.067);
//   --accent: oklch(0.274 0.006 286.033);
//   --accent-foreground: oklch(0.985 0 0);
//   --destructive: oklch(0.704 0.191 22.216);
//   --border: oklch(1 0 0 / 10%);
//   --input: oklch(1 0 0 / 15%);
//   --ring: oklch(0.554 0.135 66.442);
//   --chart-1: oklch(0.488 0.243 264.376);
//   --chart-2: oklch(0.696 0.17 162.48);
//   --chart-3: oklch(0.769 0.188 70.08);
//   --chart-4: oklch(0.627 0.265 303.9);
//   --chart-5: oklch(0.645 0.246 16.439);
//   --sidebar: oklch(0.21 0.006 285.885);
//   --sidebar-foreground: oklch(0.985 0 0);
//   --sidebar-primary: oklch(0.795 0.184 86.047);
//   --sidebar-primary-foreground: oklch(0.421 0.095 57.708);
//   --sidebar-accent: oklch(0.274 0.006 286.033);
//   --sidebar-accent-foreground: oklch(0.985 0 0);
//   --sidebar-border: oklch(1 0 0 / 10%);
//   --sidebar-ring: oklch(0.554 0.135 66.442);
