import 'package:get/get.dart';

import '../../domain/models/dictionary_model.dart';
import '../../domain/usecases/get_words_usecase.dart';


class DictionaryController extends GetxController {
  final GetWordsUseCase getWordsUseCase;

  var words = <DictionaryModel>[].obs;
  var isLoading = true.obs;

  DictionaryController(this.getWordsUseCase);

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
}
