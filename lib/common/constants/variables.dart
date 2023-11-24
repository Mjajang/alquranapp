import 'package:flutter_dotenv/flutter_dotenv.dart';

class Variables {
  static String getBaseUrl() {
    return dotenv.env['API_URL'] ?? '';
  }
}
