import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/dictionary_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final DictionaryController controller = Get.find();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Dictionary"),
        // actions: [
        //   Icon(Icons.search_rounded),
        //   Icon(Icons.filter_list)
        // ],
      ),
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
              trailing: IconButton(
                icon: Icon(
                  controller.words[index].fav == 1 ? Icons.favorite : Icons.favorite_border,
                  color: controller.words[index].fav == 1 ? Colors.red : Colors.grey,
                ),
                onPressed: () {
                  controller.toggleFavourite(controller.words[index].id!, controller.words[index].fav);
                },
              ),
            );
          },
        );
      }),
    );
  }
}
