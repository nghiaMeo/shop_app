import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop_app/presentation/choose_mode/bloc/theme_event.dart';
import 'package:shop_app/presentation/choose_mode/bloc/theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  final SharedPreferences prefs;

  ThemeBloc(this.prefs) : super(ThemeState(_loadInitialTheme(prefs))) {
    final initialThemeMode = _loadInitialTheme(prefs);
    emit(ThemeState(initialThemeMode));
    _onUpdateTheme();
  }

  void _onUpdateTheme() {
    on<UpdateThemeEvent>((event, emit) async {
      emit(ThemeState(event.themeMode));
      await _saveTheme(event.themeMode);
    });
  }

  static ThemeMode _loadInitialTheme(SharedPreferences prefs) {
    final savedThemeIndex =
        prefs.getInt('theme_mode') ?? ThemeMode.system.index;
    return ThemeMode.values[savedThemeIndex];
  }

  Future<void> _saveTheme(ThemeMode themeMode) async {
    await prefs.setInt('theme_mode', themeMode.index);
  }
}
