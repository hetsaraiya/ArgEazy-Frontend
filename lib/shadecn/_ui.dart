import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

final Color primaryColor = Colors.blueGrey[900]!;
    final Color primaryForeground = Colors.white;
    final Color secondaryColor = Colors.blueGrey[700]!;
    final Color secondaryForeground = Colors.white;
    final Color backgroundColor = Colors.grey[900]!;
    final Color foregroundColor = Colors.white;
    final Color cardColor = Colors.grey[850]!;
    final Color cardForeground = Colors.white;
    final Color popoverColor = Colors.grey[800]!;
    final Color popoverForeground = Colors.white;
    final Color mutedColor = Colors.grey[700]!;
    final Color mutedForeground = Colors.white;
    final Color accentColor = Colors.blue[600]!;
    final Color accentForeground = Colors.white;
    final Color destructiveColor = Colors.red[600]!;
    final Color destructiveForeground = Colors.white;
    final Color borderColor = Colors.grey[600]!;
    final Color inputColor = Colors.white;
    final Color ringColor = Colors.blue[300]!;
    final Color selectionColor = Colors.blue[100]!;

    // Define the start and end color schemes
    final ShadColorScheme startScheme = ShadColorScheme(
      background: backgroundColor,
      foreground: foregroundColor,
      card: cardColor,
      cardForeground: cardForeground,
      popover: popoverColor,
      popoverForeground: popoverForeground,
      primary: primaryColor,
      primaryForeground: primaryForeground,
      secondary: secondaryColor,
      secondaryForeground: secondaryForeground,
      muted: mutedColor,
      mutedForeground: mutedForeground,
      accent: accentColor,
      accentForeground: accentForeground,
      destructive: destructiveColor,
      destructiveForeground: destructiveForeground,
      border: borderColor,
      input: inputColor,
      ring: ringColor,
      selection: selectionColor,
    );

    final ShadColorScheme endScheme = ShadColorScheme(
      background: Colors.black,
      foreground: Colors.white,
      card: Colors.black87,
      cardForeground: Colors.white,
      popover: Colors.black54,
      popoverForeground: Colors.white,
      primary: Colors.black,
      primaryForeground: Colors.white,
      secondary: Colors.grey[800]!,
      secondaryForeground: Colors.white,
      muted: Colors.grey[700]!,
      mutedForeground: Colors.white,
      accent: Colors.blue[900]!,
      accentForeground: Colors.white,
      destructive: Colors.red[800]!,
      destructiveForeground: Colors.white,
      border: Colors.grey[900]!,
      input: Colors.black,
      ring: Colors.blue[400]!,
      selection: Colors.blue[200]!,
    );