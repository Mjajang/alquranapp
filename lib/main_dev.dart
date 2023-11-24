import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'app.dart';
import 'config/config.dart';
import 'config/flavor_type.dart';

Future<void> main() async {
  await dotenv.load(fileName: ".dev.env");

  final devAppConfig = AppConfig(
    appName: "Al-Qur\\'an App DEV",
    flavor: FlavorType.dev,
  );

  Widget app = await initializeApp(devAppConfig);
  runApp(app);
}
