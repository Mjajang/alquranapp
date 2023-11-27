import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper {
  static final DbHelper _instance = DbHelper._internal();
  static Database? _database;

  DbHelper._internal();

  factory DbHelper() => _instance;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await initDb();
    return _database!;
  }

  Future<Database> initDb() async {
    String databasePath = await getDatabasesPath();
    String path = join(databasePath, 'alquranapp.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: DatabaseCreator.createTables,
    );
  }
}

class DatabaseCreator {
  static Future<void> createTables(Database db, int version) async {
    await createListSurahTable(db);
  }

  static Future<void> createListSurahTable(Database db) async {
    const String tbListSurah = 'tb_list_surah';
    const String fieldId = 'id';
    const String fieldNomor = 'nomor';
    const String fieldNama = 'nama';
    const String fieldNamaLatin = 'namaLatin';
    const String fieldJumlahAyat = 'jumlahAyat';
    const String fieldTempatTurun = 'tempatTurun';
    const String fieldArti = 'arti';
    const String fieldDeskripsi = 'deskripsi';
    const String fieldAudioFull = 'audioFull';

    var masterListSurah = """
  CREATE TABLE $tbListSurah(
    $fieldId INTEGER PRIMARY KEY AUTOINCREMENT,
    $fieldNomor INTEGER,
    $fieldNama TEXT,
    $fieldNamaLatin TEXT,
    $fieldJumlahAyat INTEGER,
    $fieldTempatTurun TEXT,
    $fieldArti TEXT,
    $fieldDeskripsi TEXT,
    $fieldAudioFull TEXT
  )
  """;

    await db.execute(masterListSurah);
  }
}

class DatabaseGetLocalData {
  Future<List<Map<String, dynamic>>> getAllListSurahLocalData(
      Database db) async {
    final List<Map<String, dynamic>> localData =
        await db.query('tb_list_surah');

    return localData;
  }
}
