// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:alquranapp/common/constants/text_style.dart';
import 'package:alquranapp/data/models/list_surah_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../common/constants/colors.dart';
import 'bloc/detail_surah/detail_surah_bloc.dart';

class SurahDetailPage extends StatefulWidget {
  final List<ListSurahModel> listSurah;
  final int initialIndex;
  final String numberSurah;

  const SurahDetailPage({
    Key? key,
    required this.listSurah,
    this.initialIndex = 0,
    required this.numberSurah,
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

    BlocProvider.of<DetailSurahBloc>(context)
        .add(DetailSurahGetEvent(widget.numberSurah));

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
      body: BlocBuilder<DetailSurahBloc, DetailSurahState>(
        builder: (context, state) {
          if (state is DetailSurahError) {
            return Center(
              child: Text(state.message),
            );
          }

          if (state is DetailSurahSuccess) {
            final data = state.response.data;

            return ListView(
              children: [
                Container(
                  margin: const EdgeInsets.all(10),
                  width: double.infinity,
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: const LinearGradient(
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
                        data!.tempatTurun.toString(),
                        style: blackTextStyleSecondary,
                      ),
                      Column(
                        children: [
                          Text(
                            data.namaLatin.toString(),
                            style: blackTextStyleSecondary,
                          ),
                          Text(
                            "(${data.arti})",
                            style: blackTextStyleSecondary,
                          ),
                        ],
                      ),
                      Text(
                        "${data.jumlahAyat} ayat",
                        style: blackTextStyleSecondary,
                      ),
                    ],
                  ),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: data.ayat!.length,
                  itemBuilder: (context, index) {
                    final ayat = data.ayat![index];

                    final color =
                        index.isEven ? ColorName.bgColor : ColorName.bg200Color;

                    return Container(
                      color: color,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Table(
                              columnWidths: const {
                                0: FixedColumnWidth(40),
                                1: FlexColumnWidth(3),
                              },
                              defaultVerticalAlignment:
                                  TableCellVerticalAlignment.top,
                              children: [
                                buildTableRow(
                                  label: ayat.nomorAyat.toString(),
                                  data: ayat.teksArab.toString(),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              "${ayat.teksLatin}",
                              textAlign: TextAlign.justify,
                              style: blackTextStyleSecondary.copyWith(
                                fontSize: 18,
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              "${ayat.teksIndonesia}",
                              textAlign: TextAlign.justify,
                              style: blackTextStyle.copyWith(
                                fontSize: 18,
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ],
            );
          }

          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  TableRow buildTableRow({
    required String label,
    required String data,
  }) {
    return TableRow(
      children: [
        Container(
          height: 40,
          width: 40,
          margin: const EdgeInsets.only(top: 5),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(width: 2),
          ),
          child: Text(
            label,
            style: blackTextStyle,
          ),
        ),
        Text(
          data,
          textAlign: TextAlign.end,
          style: arabicBlackStyle.copyWith(
            fontSize: 25,
            height: 2,
          ),
        ),
      ],
    );
  }
}
