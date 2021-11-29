import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as path;

class DBHelper {
  static Future<Database> getDatabase() async {
    final dbPath = await getDatabasesPath();

    return openDatabase(path.join(dbPath, 'tasks.db'), onCreate: (db, version) {
      return db.execute(
          'CREATE TABLE due_tasks(id TEXT PRIMARY KEY, title TEXT, dueDate TEXT)');
    }, version: 1);
  }

  static Future<void> insert(Map<String, dynamic> data) async {
    final database = await getDatabase();

    await database.insert(
      'due_tasks',
      data,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  static Future<void> delete(String id) async {
    final db = await getDatabase();

    await db.delete(
      'due_tasks',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  static Future<List<Map<String, dynamic>>> fetch() async {
    final database = await getDatabase();
    return database.query('due_tasks');
  }
}
