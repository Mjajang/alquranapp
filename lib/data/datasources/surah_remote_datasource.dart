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

      return ListSurahModelResponse.fromJson(response.body);
    } catch (e) {
      throw e.toString();
    }
  }
}
