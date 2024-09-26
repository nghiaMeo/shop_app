import 'package:flutter/material.dart';

abstract class ThemeEvent {}

class UpdateThemeEvent extends ThemeEvent {
  final ThemeMode themeMode;

  UpdateThemeEvent(this.themeMode);
}