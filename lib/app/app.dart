import 'package:dictionary/app/routes/app_routes.dart';
import 'package:dictionary/app/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dictionary',
      theme: AppTheme.lightTheme,
      initialRoute: AppRoutes.initial,
      getPages: AppRoutes.routes,
    );
  }
}
