import 'dart:io';
import 'package:dictionary/resources/string_manager.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite_sqlcipher/sqflite.dart';

class DatabaseHelper {
  static Database? _database;

  static final DatabaseHelper instance = DatabaseHelper._internal();
  DatabaseHelper._internal();

  Future<Database> get database async => _database ??= await _initDatabase();

  Future<void> initializeDatabase() async {
    _database = await _initDatabase();
  }

  Future<Database> _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, StringManager.dbName);
    bool exists = await databaseExists(path);

    if (!exists) {
      await _copyDB(path);
    }

    return await _openEncryptedDatabase(path);
  }

  Future<void> _copyDB(String path) async {
    await Directory(dirname(path)).create(recursive: true);
    ByteData data = await rootBundle.load(join("assets", StringManager.dbName));
    List<int> bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
    await File(path).writeAsBytes(bytes, flush: true);
  }

  Future<Database> _openEncryptedDatabase(String path) async {
    return await openDatabase(path,
        password: StringManager.dbPassword,
        version: 1);
  }
}
