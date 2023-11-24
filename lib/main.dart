import 'package:alquranapp/persentations/home/home_page.dart';
import 'package:alquranapp/persentations/home/splash_page.dart';
import 'package:flutter/material.dart';

import 'common/constants/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
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
