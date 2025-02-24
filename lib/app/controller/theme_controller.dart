import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ThemeController extends GetxController {
  final _box = GetStorage();
  late ThemeMode themeMode;

  ThemeController() {
    String? savedTheme = _box.read('themeMode');
    themeMode = (savedTheme == 'dark') ? ThemeMode.dark : ThemeMode.light;
  }

  void toggleTheme() {
    if (themeMode == ThemeMode.light) {
      themeMode = ThemeMode.dark;
      _box.write('themeMode', 'dark');
    } else {
      themeMode = ThemeMode.light;
      _box.write('themeMode', 'light');
    }
    update();
  }
}
