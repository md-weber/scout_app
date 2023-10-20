import 'package:digital_cafe_karlsruhe/theme/theme_state.dart';
import 'package:digital_cafe_karlsruhe/theme/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
