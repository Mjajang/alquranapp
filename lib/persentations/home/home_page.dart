import 'package:flutter/material.dart';

import '../../common/constants/text_style.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "AL-Qur'an App",
          style: TextStyleName.blackTextStyle,
        ),
      ),
    );
  }
}