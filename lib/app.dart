import 'package:flutter/material.dart';

import 'common/constants/colors.dart';
import 'config/config.dart';
import 'persentations/home/home_page.dart';
import 'persentations/home/splash_page.dart';

Future<Widget> initializeApp(AppConfig appConfig) async {
  WidgetsFlutterBinding.ensureInitialized();

  return const MyApp();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: ColorName.bg300Color),
        useMaterial3: true,
        scaffoldBackgroundColor: ColorName.bgColor,
      ),
      routes: {
        "/": (context) => const SplashPage(),
        '/home-page': (context) => const HomePage(),
      },
    );
  }
}
