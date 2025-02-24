import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app/app.dart';
import 'app/controller/theme_controller.dart';


void main() {
  Get.put(ThemeController());
  runApp(const MyApp());
}


