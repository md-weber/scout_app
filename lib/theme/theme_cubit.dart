import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scout_app/theme/theme_state.dart';
import 'package:scout_app/theme/themes.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit(ThemeData themeData, AvailableThemes currentTheme)
      : super(
          ThemeState(
            appTheme: themeData,
            currentTheme: currentTheme,
          ),
        );

  void toggleLightMode() {
    emit(
      state.copyWith(
        appTheme: lightTheme,
        currentTheme: AvailableThemes.light,
      ),
    );
  }

  void toggleDarkMode() {
    emit(
      state.copyWith(
        appTheme: darkTheme,
        currentTheme: AvailableThemes.dark,
      ),
    );
  }
}
