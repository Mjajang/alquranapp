import 'package:alquranapp/data/models/detail_surah_model.dart';
import 'package:http/http.dart' as http;

import '../../common/constants/variables.dart';

class DetailSurahRemoteDatasource {
  Future<DetailSurahResponseModel> getDetailSurah(String numberSurah) async {
    try {
      final response = await http
          .get(Uri.parse("${Variables.getBaseUrl()}/surat/$numberSurah"));

      if (response.statusCode != 200) {
        throw 'Failed to get Detail Surah';
      }

      return DetailSurahResponseModel.fromJson(response.body);
    } catch (e) {
      throw e.toString();
    }
  }
}
