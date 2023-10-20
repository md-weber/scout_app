import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'theme_state.freezed.dart';

@freezed
class ThemeState with _$ThemeState {
  const factory ThemeState({
    required ThemeData appTheme,
    required AvailableThemes currentTheme
  }) = _ThemeState;
}

enum AvailableThemes {
  dark,
  light
}