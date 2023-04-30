import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo_app/task.dart';

class DatabaseHelper {

  DatabaseHelper._instance();
  static final DatabaseHelper instance = DatabaseHelper._instance();
  static Database? _db;


  String taskTable = 'task_table';
  String colId = 'id';
  String colTitle = 'title';
  String colDate = 'date';
  String colPriority = 'priority';
  String colStatus = 'status';


  Future<Database?> get db async => _db ??= await _initDb();

  Future<Database> _initDb() async {
    Directory dir = await getApplicationDocumentsDirectory();
    String path = '${dir.path}todo_list.db';
    final todoListDb = await openDatabase(path, version: 1, onCreate: _createDb);
    return todoListDb;
  }

  void _createDb(Database db, int version) async {
    await db.execute(
        'CREATE TABLE $taskTable($colId INTEGER PRIMARY KEY AUTOINCREMENT,'
            '$colTitle TEXT,'
            '$colDate TEXT,'
            '$colPriority TEXT,'
            '$colStatus INTEGER);');
  }

  Future<List<Map<String, dynamic>>?> getTaskMapList() async {
    Database? db = await this.db;
    final List<Map<String, Object?>>? result = await db?.query(taskTable);
    return result;
  }

  Future <List<Task>> getTaskList() async {
    final List<Map<String, dynamic>>? taskMapList = await getTaskMapList();
    final List<Task> taskList = [];
    taskMapList?.forEach((element) {
      taskList.add(Task.fromMap(element));
    });
    return taskList;
  }

  Future<int?> insertTask(Task task) async {
    Database? db = await this.db;
    final int? result = await db?.insert(taskTable, task.toMap());
    return result;
  }

  Future<int?> updateTask(Task task) async {
    Database? db = await this.db;
    final result = await db?.update(taskTable, task.toMap(), where: '$colId=?', whereArgs: [task.id]);
    return result;
  }

  Future<int?> deleteTask(int? id) async {
    Database? db = await this.db;
    final int? result = await db?.delete(taskTable, where: '$colId = ?', whereArgs: [id]);
    return result;
  }
}