import '../../domain/models/dictionary_model.dart';
import '../datasources/local/database_helper.dart';

class DictionaryRepository {
  final DatabaseHelper dbHelper;

  DictionaryRepository(this.dbHelper);

  Future<List<DictionaryModel>> getWords() async {
    final db = await dbHelper.database;

    final List<Map<String, dynamic>> maps = await db.rawQuery(
        '''
    SELECT DISTINCT * FROM dummy_data
    '''
    );

    return maps.map((map) => DictionaryModel.fromMap(map)).toList();
  }
  Future<void> updateFavourite(int id, int fav) async {
    final db = await dbHelper.database;
    await db.update(
      'dummy_data',
      {'fav': fav},
      where: 'id = ?',
      whereArgs: [id],
    );
  }

}

