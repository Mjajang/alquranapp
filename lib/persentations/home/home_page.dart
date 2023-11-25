import 'package:alquranapp/persentations/bookmark/bookmark_page.dart';
import 'package:alquranapp/persentations/juz/juz_page.dart';
import 'package:alquranapp/persentations/surah/surah_page.dart';
import 'package:flutter/material.dart';

import '../../common/constants/colors.dart';
import '../../common/constants/text_style.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Widget> _pages = [
    const SurahPage(),
    const JuzPage(),
    const BookmarkPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Al-Qur'an App",
            style: blackTextStyle.copyWith(
              fontWeight: semiBold,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.import_contacts_rounded,
                color: ColorName.textColor,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.more_vert_rounded,
                color: ColorName.textColor,
              ),
            ),
          ],
          elevation: 0,
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  ColorName.bg300Color,
                  ColorName.bg200Color,
                ],
                begin: Alignment.topLeft,
                end: Alignment.topRight,
              ),
            ),
          ),
          bottom: const TabBar(
            indicatorColor: ColorName.accentColor,
            unselectedLabelColor: ColorName.text200Color,
            labelColor: ColorName.textColor,
            indicatorSize: TabBarIndicatorSize.tab,
            tabs: [
              Tab(text: "SURAH"),
              Tab(text: 'JUZ'),
              Tab(text: 'BOOKMARK'),
            ],
          ),
        ),
        body: TabBarView(
          children: _pages,
        ),
      ),
    );
  }
}
