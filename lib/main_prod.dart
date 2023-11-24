import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'app.dart';
import 'config/config.dart';
import 'config/flavor_type.dart';

Future<void> main() async {
  await dotenv.load(fileName: ".env");

  final prodAppConfig = AppConfig(
    appName: "Al-Qur\\'an App",
    flavor: FlavorType.prod,
  );

  Widget app = await initializeApp(prodAppConfig);
  runApp(app);
}
