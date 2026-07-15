import 'package:flutter/foundation.dart';
import 'package:sqflite_common_ffi_web/sqflite_ffi_web.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();

  static Database? _database;

  DatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('roadmap_progress.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    if (kIsWeb) {
      databaseFactory = databaseFactoryFfiWeb;
      return await databaseFactory.openDatabase(
        filePath,
        options: OpenDatabaseOptions(
          version: 1,
          onCreate: _createDB,
        ),
      );
    } else if (defaultTargetPlatform == TargetPlatform.windows || defaultTargetPlatform == TargetPlatform.linux) {
      sqfliteFfiInit();
      databaseFactory = databaseFactoryFfi;
      final dbPath = await getDatabasesPath();
      final path = join(dbPath, filePath);
      return await databaseFactory.openDatabase(
        path,
        options: OpenDatabaseOptions(
          version: 1,
          onCreate: _createDB,
        ),
      );
    } else {
      final dbPath = await getDatabasesPath();
      final path = join(dbPath, filePath);

      return await openDatabase(
        path,
        version: 1,
        onCreate: _createDB,
      );
    }
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
CREATE TABLE progress (
  id TEXT PRIMARY KEY
)
''');

    await db.execute('''
CREATE TABLE notes (
  id TEXT PRIMARY KEY,
  note TEXT NOT NULL
)
''');
  }

  // Memory fallback for Web
  Set<String> _webProgressCache = {};
  Map<String, String> _webNotesCache = {};

  Future<void> saveProgress(Set<String> progress) async {
    if (kIsWeb) {
      _webProgressCache = Set.from(progress);
      return;
    }
    final db = await instance.database;
    await db.delete('progress');
    
    Batch batch = db.batch();
    for (String id in progress) {
      batch.insert('progress', {'id': id});
    }
    await batch.commit(noResult: true);
  }

  Future<Set<String>> loadProgress() async {
    if (kIsWeb) return Set.from(_webProgressCache);
    final db = await instance.database;
    final result = await db.query('progress');
    return result.map((e) => e['id'] as String).toSet();
  }

  Future<void> saveNotes(Map<String, String> notes) async {
    if (kIsWeb) {
      _webNotesCache = Map.from(notes);
      return;
    }
    final db = await instance.database;
    await db.delete('notes');

    Batch batch = db.batch();
    notes.forEach((key, value) {
      batch.insert('notes', {'id': key, 'note': value});
    });
    await batch.commit(noResult: true);
  }

  Future<Map<String, String>> loadNotes() async {
    if (kIsWeb) return Map.from(_webNotesCache);
    final db = await instance.database;
    final result = await db.query('notes');
    Map<String, String> notes = {};
    for (var row in result) {
      notes[row['id'] as String] = row['note'] as String;
    }
    return notes;
  }
}
