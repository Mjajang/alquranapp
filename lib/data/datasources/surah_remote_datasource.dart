import '../models/list_surah_model.dart';
import 'package:http/http.dart' as http;

class SurahRemoteDatasource {
  Future<ListSurahModel> getListSurah() async {
    try {
      final response = await http.get(Uri.parse(""));

      if (response.statusCode != 200) {
        throw 'Failed get list surah';
      }

      return ListSurahModel.fromJson(response.body);
    } catch (e) {
      throw e.toString();
    }
  }
}
