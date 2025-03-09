import 'package:dictionary/app/routes/app_routes.dart';
import 'package:dictionary/app/theme.dart';
import 'package:dictionary/resources/string_manager.dart';
import 'package:dictionary/app/controller/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = Get.find();

    return Obx(() {
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: StringManager.appTitle,
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: themeController.isDarkMode.value ? ThemeMode.dark : ThemeMode.light,
        initialRoute: AppRoutes.initial,
        getPages: AppRoutes.routes,
      );
    });
  }
}
