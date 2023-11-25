// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:alquranapp/common/constants/text_style.dart';
import 'package:alquranapp/data/models/list_surah_model.dart';

import '../../common/constants/colors.dart';

class SurahDetailPage extends StatefulWidget {
  final List<ListSurahModel> listSurah;
  final int initialIndex;

  const SurahDetailPage({
    Key? key,
    required this.listSurah,
    this.initialIndex = 0,
  }) : super(key: key);

  @override
  State<SurahDetailPage> createState() => _SurahDetailPageState();
}

class _SurahDetailPageState extends State<SurahDetailPage>
    with TickerProviderStateMixin {
  late List<Tab> tabs;
  late List<Widget> pages;
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    tabs = widget.listSurah
        .map((surah) => Tab(
              text: surah.namaLatin,
            ))
        .toList();

    pages = widget.listSurah
        .map((surah) => DetailSurah(
              surah: surah,
            ))
        .toList();

    _tabController = TabController(
      vsync: this,
      length: widget.listSurah.length,
      initialIndex: widget.initialIndex,
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: widget.listSurah.length,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios_rounded,
              color: ColorName.textColor,
            ),
          ),
          title: TabBar(
            isScrollable: true,
            tabAlignment: TabAlignment.center,
            indicatorColor: ColorName.accentColor,
            unselectedLabelColor: ColorName.text200Color,
            labelColor: ColorName.textColor,
            indicatorSize: TabBarIndicatorSize.tab,
            tabs: tabs,
            controller: _tabController,
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.more_vert_rounded,
                color: ColorName.textColor,
              ),
            ),
          ],
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
        ),
        body: TabBarView(
          controller: _tabController,
          children: pages,
        ),
      ),
    );
  }
}

class DetailSurah extends StatefulWidget {
  final ListSurahModel surah;

  const DetailSurah({
    Key? key,
    required this.surah,
  }) : super(key: key);

  @override
  State<DetailSurah> createState() => _DetailSurahState();
}

class _DetailSurahState extends State<DetailSurah> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16.0),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
              gradient: LinearGradient(
                colors: [
                  ColorName.bg300Color,
                  ColorName.bg200Color,
                ],
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'Makah',
                  style: blackTextStyleSecondary,
                ),
                Text(
                  "Surah",
                  style: blackTextStyleSecondary,
                ),
                Text(
                  "Ayat",
                  style: blackTextStyleSecondary,
                ),
              ],
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: 7,
            itemBuilder: (context, index) {
              return const ListTile(
                title: Text('Ayat'),
              );
            },
          ),
        ],
      ),
    );
  }
}

class CenteredTabBar extends StatelessWidget implements PreferredSizeWidget {
  final TabBar tabBar;
  @override
  final Size preferredSize;

  CenteredTabBar({super.key, required this.tabBar})
      : preferredSize = tabBar.preferredSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: tabBar,
    );
  }
}
