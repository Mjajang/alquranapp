import 'package:alquranapp/data/models/list_surah_model.dart';
import 'package:sqflite/sqflite.dart';

import 'db_helper.dart';

class SurahLocalDatasource {
  final DbHelper _dbHelper = DbHelper();
  final DatabaseGetLocalData _dbLocal = DatabaseGetLocalData();

  Future<int> saveListSurah(ListSurahModel data) async {
    final db = await _dbHelper.database;

    return await db.insert(
      'tb_list_surah',
      data.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<ListSurahModel>> getLocalListSurah() async {
    final db = await _dbHelper.database;
    var dataLocal = await _dbLocal.getAllListSurahLocalData(db);

    return List.generate(dataLocal.length, (index) {
      return ListSurahModel.fromMap(dataLocal[index]);
    });
  }
}
