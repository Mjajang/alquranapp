import 'package:alquranapp/persentations/home/home_page.dart';
import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:flutter/material.dart';

import '../../common/constants/colors.dart';
import '../../common/constants/text_style.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FlutterSplashScreen.fadeIn(
        childWidget: Text(
          "AL-Qur'an App",
          style: FontStyleName.blackTextStyle,
        ),
        duration: const Duration(seconds: 5),
        backgroundColor: ColorName.textColor,
        nextScreen: const HomePage(),
      ),
    );
  }
}
