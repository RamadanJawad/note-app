import 'package:note_app/model/note.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class MyDb {
  static Database? _db;
  static const String tableName = "notes";
  static const String dbName = "note.db";

  Future<Database?> get db async {
    if (_db == null) {
      _db = await initDb();
      return _db;
    }
    return _db;
  }

  initDb() async {
    String databasePath = await getDatabasesPath();
    String path = join(
      databasePath,dbName
    );
    Database myDb = await openDatabase(path,
        version: 1, onCreate: _onCreate, onUpgrade: _onUpgrade);
    return myDb;
  }

  _onUpgrade(Database db, int oldVersion, int newVersion) async {
    // await db.execute("ALTER TABLE task ADD COLUMN color TEXT NOT NULL");
    print("onUpgrade Database Success !");
  }

  _onCreate(Database db, int version) async {
    await db.execute('''
          CREATE TABLE $tableName(
            id INTEGER NOT NULL PRIMARY KEY,
            title TEXT NOT NULL,
            details TEXT NOT NULL,
            imagePath TEXT,
            urlPath TEXT NOT NULL,
            dateTimeEdited TEXT NOT NULL,
            dateTimeCreated TEXT NOT NULL
          )
    ''');
    print("Create Database Success !");
  }

  Future<int> insertData(Note note) async {
    Database? database = await db;
    return await database!.insert("notes", note.toMap());
    
  }
  Future<String> getImageLink() async {
    Database? database = await db;
    List<Map<String, dynamic>> result = await database!.query(tableName);
    if (result.length == 0) return "null";
    return result[0]["imagePath"];
  }

  Future<int> updateNote(Note note) async {
    Database? database = await db;
    return await database!.update(
      tableName,
      note.toMap(),
      where: "id = ?",
      whereArgs: [note.id],
    );
  }
  Future<List<Note>> readNotes() async {
    Database? database = await db;
    final List<Map<String, dynamic>> maps = await database!.query(tableName);

    return List.generate(
      maps.length,
          (index) {
        return Note(
          id: maps[index]["id"],
          title: maps[index]["title"],
          image: maps[index]["imagePath"],
          url: maps[index]["urlPath"],
          details: maps[index]["details"],
          dateTimeEdited: maps[index]["dateTimeEdited"],
          dateTimeCreated: maps[index]["dateTimeCreated"],
        );
      },
    );
  }

  Future<int> deleteNote(Note note) async {
    Database? database = await db;
    return await database!.delete(
      "notes",
      where: "id = ?",
      whereArgs: [note.id],
    );
  }

  Future<int> deleteAllNotes() async {
    Database? database = await db;
    return await database!.delete(tableName);
  }
}
