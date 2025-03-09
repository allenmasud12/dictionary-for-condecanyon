import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../app/controller/theme_controller.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = Get.find();

    return Scaffold(
      appBar: AppBar(title: const Text("Menu Screen")),
      body: Center(
        child: Obx(() {
          return ElevatedButton(
            onPressed: themeController.toggleTheme,
            child: Text(
              themeController.isDarkMode.value ? "Switch to Light Mode" : "Switch to Dark Mode",
            ),
          );
        }),
      ),
    );
  }
}
