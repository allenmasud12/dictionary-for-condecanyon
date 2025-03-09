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

  Future<void> getFavourite() async {
    favouriteWords.clear();
    favouriteWords.addAll(words.where((word) => word.fav == 1));
  }


  /// Update favorite list
  void updateFavouriteList() {
    favouriteWords.assignAll(words.where((word) => word.fav == 1).toList());
  }

  /// Toggle favorite status
  Future<void> toggleFavourite(int wordId) async {
    final word = words.firstWhere((w) => w.id == wordId);
    final newFavStatus = word.fav == 1 ? 0 : 1;

    await updateFavouriteUseCase(wordId, newFavStatus);

    word.fav = newFavStatus;
    words.refresh();
    getFavourite();
  }

}
