import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsReposistory {
  Future<bool> isFirstRun() async {
    final prefs = await SharedPreferences.getInstance();
    final isFirstRun = prefs.getBool('isFirstRun');

    if (isFirstRun ?? false) return true;
    return false;
  }

  Future<void> setupNotifications() async {}

  Future<ThemeMode> getThemeMode() async {
    final prefs = await SharedPreferences.getInstance();
    final theme = prefs.getString('theme');
    switch (theme) {
      case 'light':
        return ThemeMode.light;
      case 'dark':
        return ThemeMode.dark;
      default:
        final brightness = SchedulerBinding.instance.window.platformBrightness;
        if (brightness == Brightness.dark) return ThemeMode.dark;
        return ThemeMode.light;
    }
  }

  Future<void> setThemeMode(ThemeMode themeMode) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('theme', themeMode.name);
  }
}
