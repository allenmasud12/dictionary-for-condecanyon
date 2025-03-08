import '../../data/repositories/dictionary_repository.dart';

class UpdateFavouriteUseCase {
  final DictionaryRepository repository;
  UpdateFavouriteUseCase(this.repository);

  Future<void> call(int id, int fav) async {
    return repository.updateFavourite(id, fav);
  }
}