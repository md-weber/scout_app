import 'package:flutter/material.dart';

ThemeData darkTheme = ThemeData.dark().copyWith(
  textTheme: ThemeData.dark().textTheme.copyWith(
        bodyMedium: ThemeData.dark().textTheme.bodyMedium!.copyWith(height: 2),
      ),
);

ThemeData lightTheme = ThemeData.light().copyWith(
  textTheme: ThemeData.light().textTheme.copyWith(
        bodyMedium: ThemeData.light().textTheme.bodyMedium!.copyWith(height: 2),
      ),
);
