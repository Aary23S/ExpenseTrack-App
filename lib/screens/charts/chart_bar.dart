// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  const ChartBar({
    super.key,
    required this.fill,
  });

  final double fill;

  @override
  Widget build(BuildContext context) {
    // Use the active Theme's ColorScheme so the bar colors follow the
    // app-wide seed color and automatically adapt to light/dark modes.
    final ColorScheme cs = Theme.of(context).colorScheme;
    final bool isDarkMode = cs.brightness == Brightness.dark;
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4),
        child: FractionallySizedBox(
          heightFactor: fill,
          child: DecoratedBox(
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(8)),
                // Choose a color from the ColorScheme. In dark mode we pick
                // a solid primary for good contrast; in light mode we use a
                // slightly translucent primary so bars feel softer against
                // the light background. You can switch to `cs.secondary` or
                // `cs.tertiary` for accent colors, or use `primaryContainer`
                // for container-surface tones in Material 3.
                color: (isDarkMode
                  ? cs.primary
                  : cs.primary.withOpacity(0.65)),
            ),
          ),
        ),
      ),
    );
  }
}