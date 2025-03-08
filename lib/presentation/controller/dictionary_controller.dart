import 'package:get/get.dart';

import '../../domain/models/dictionary_model.dart';
import '../../domain/usecases/get_words_usecase.dart';
import '../../domain/usecases/update_favourite_usecase.dart';

class DictionaryController extends GetxController {
  final GetWordsUseCase getWordsUseCase;
  final UpdateFavouriteUseCase updateFavouriteUseCase;

  var words = <DictionaryModel>[].obs;
  var favouriteWords = <DictionaryModel>[].obs;
  var isLoading = true.obs;

  DictionaryController(this.getWordsUseCase, this.updateFavouriteUseCase);

  @override
  void onInit() {
    fetchWords();
    super.onInit();
  }

  Future<void> fetchWords() async {
    isLoading(true);
    try {
      words.value = await getWordsUseCase();
    } finally {
      isLoading(false);
    }
  }

  /// Update favorite list
  void updateFavouriteList() {
    favouriteWords.assignAll(words.where((word) => word.fav == 1).toList());
  }

  /// Toggle favorite status
  Future<void> toggleFavourite(int id, int fav) async {
    int newStatus = fav == 1 ? 0 : 1;
    await updateFavouriteUseCase(id, newStatus);

    // Update UI
    words.firstWhere((word) => word.id == id).fav = newStatus;
    words.refresh();
    updateFavouriteList();
  }
}
