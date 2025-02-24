import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/dictionary_controller.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final DictionaryController controller = Get.find();

    return Scaffold(
      appBar: AppBar(title: const Text("Dictionary")),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        return ListView.builder(
          itemCount: controller.words.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(controller.words[index].word),
              subtitle: Text(controller.words[index].meaning),
            );
          },
        );
      }),
    );
  }
}
