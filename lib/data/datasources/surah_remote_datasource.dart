import 'package:alquranapp/data/datasources/surah_local_datasource.dart';

import '../../common/constants/variables.dart';
import '../models/list_surah_model.dart';
import 'package:http/http.dart' as http;

class SurahRemoteDatasource {
  Future<ListSurahModelResponse> getListSurah() async {
    try {
      final response = await http.get(
        Uri.parse("${Variables.getBaseUrl()}/surat"),
      );

      if (response.statusCode != 200) {
        throw 'Failed get list surah';
      }

      final listSurahResponse = ListSurahModelResponse.fromJson(response.body);

      for (var surah in listSurahResponse.data!) {
        await SurahLocalDatasource().saveListSurah(surah);
      }

      return listSurahResponse;
    } catch (e) {
      throw e.toString();
    }
  }
}
