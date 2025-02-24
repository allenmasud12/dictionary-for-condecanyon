import '../../data/repositories/dictionary_repository.dart';
import '../models/dictionary_model.dart';

class GetWordsUseCase {
  final DictionaryRepository repository;

  GetWordsUseCase(this.repository);

  Future<List<DictionaryModel>> call() async {
    return await repository.getWords();
  }
}
