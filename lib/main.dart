import 'package:dictionary/presentation/controller/dictionary_controller.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app/app.dart';
import 'app/app_config.dart';
import 'app/controller/theme_controller.dart';
import 'data/datasources/local/database_helper.dart';
import 'data/repositories/dictionary_repository.dart';
import 'domain/usecases/get_words_usecase.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  if (AppConfig.enableFirebase) {
    await Firebase.initializeApp();
  }
  await DatabaseHelper.instance.initializeDatabase();

  Get.put(DatabaseHelper.instance);
  Get.put(DictionaryRepository(Get.find()));
  Get.put(GetWordsUseCase(Get.find()));
  Get.put(DictionaryController(Get.find()));
  Get.put(ThemeController());
  runApp(const MyApp());
}


