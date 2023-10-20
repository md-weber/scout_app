import 'package:digital_cafe_karlsruhe/theme/theme_cubit.dart';
import 'package:digital_cafe_karlsruhe/theme/theme_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DarkModeToggle extends StatelessWidget {
  const DarkModeToggle({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.watch<ThemeCubit>();
    return theme.state.currentTheme == AvailableThemes.dark ? IconButton(
      onPressed: () {
        theme.toggleLightMode();
      },
      icon: const Icon(Icons.sunny),
    ) : IconButton(
      onPressed: () {
        theme.toggleDarkMode();
      },
      icon: const Icon(Icons.nightlight),
    );
  }
}
