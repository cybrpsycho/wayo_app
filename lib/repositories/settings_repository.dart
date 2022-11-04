import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:wayo/locator.dart';
import 'package:wayo/services/notification_service.dart';
import 'package:wayo/services/cache_service.dart';

class SettingsReposistory {
  final _notificationService = locator.get<NotificationService>();
  final _storageService = locator.get<CacheService>();

  Future<bool> isFirstRun() async {
    final flag = await _storageService.getFlag('isFirstRun');
    if (flag == null) {
      await _storageService.setFlag('isFirstRun', false);
      return true;
    }
    return false;
  }

  Future<void> setupNotifications() async {
    final storedToken = await _storageService.getString('FCMToken');
    final currentToken = await _notificationService.getFCMToken();

    if (storedToken == null || storedToken != currentToken) {
      await _storageService.setString('FCMToken', currentToken);
    }

    _notificationService.subToFCMTokenUpdates();
  }

  Future<ThemeMode> getThemeMode() async {
    final theme = await _storageService.getString('theme');
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
    await _storageService.setString('theme', themeMode.name);
  }
}
