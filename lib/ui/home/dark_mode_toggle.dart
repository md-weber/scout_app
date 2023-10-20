import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scout_app/theme/theme_cubit.dart';
import 'package:scout_app/theme/theme_state.dart';

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
