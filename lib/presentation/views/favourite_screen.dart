import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/dictionary_controller.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final DictionaryController controller = Get.find();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Favourite Words"),
      ),
      body: Obx(() {
        if (controller.favouriteWords.isEmpty) {
          return const Center(child: Text("No favourites yet."));
        }

        return ListView.builder(
          itemCount: controller.favouriteWords.length,
          itemBuilder: (context, index) {
            final word = controller.favouriteWords[index];

            return ListTile(
              title: Text(word.word),
              subtitle: Text(word.meaning),
              trailing: IconButton(
                icon: const Icon(Icons.favorite, color: Colors.red),
                onPressed: () {
                  controller.toggleFavourite(word.id!);
                },
              ),
            );
          },
        );
      }),
    );
  }
}
