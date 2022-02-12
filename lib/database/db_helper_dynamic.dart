import 'dart:io';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseHelper {
  static const _databaseName = "BreathDatabase.db";
  static const _databaseVersion = 1;

  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();
  factory DatabaseHelper() => instance;
  static  Database? _database;

  Future<Database?> get database async {
    if (_database != null) return _database;
    _database = await _initDatabase();
    return _database;
  }

  _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _databaseName);
    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute(
        'CREATE TABLE breathe_history (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, elapsedMinutes INTEGER, elapsedSeconds INTEGER, intervals INTEGER, createdAt TEXT)');
  }

  Future<int> insert(table, Map<String, dynamic> row) async {
    var db = await instance.database;
    return await db!.insert(table, row);
  }

  Future<List<Map<String, dynamic>>> queryAllRows(table) async {
    var db = await instance.database;
    var result = await db!.query(table);
    return result.toList();
  }

  Future<int?> queryRowCount(table) async {
    var db = await instance.database;
    return Sqflite.firstIntValue(
        await db!.rawQuery('SELECT COUNT(*) FROM $table'));
  }

  Future<int> update(columnId, table, Map<String, dynamic> row) async {
    var db = await instance.database;
    int id = row[columnId];
    return await db!.update(table, row, where: '$columnId = ?', whereArgs: [id]);
  }

  Future<int> delete(int id, table, columnId) async {
    var db = await instance.database;
    return await db!.delete(table, where: '$columnId = ?', whereArgs: [id]);
  }
}
