import 'dart:math';

import 'package:alquranapp/persentations/surah/surah_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../common/constants/colors.dart';
import '../../common/constants/text_style.dart';
import '../../data/models/list_surah_model.dart';
import 'bloc/detail_surah/detail_surah_bloc.dart';
import 'bloc/list_surah/list_surah_bloc.dart';
import 'bloc/local_list_surah/local_list_surah_bloc.dart';

class SurahPage extends StatelessWidget {
  const SurahPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ListSurahBloc, ListSurahState>(
        builder: (context, state) {
          if (state is ListSurahLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state is ListSurahError) {
            return Center(
              child: Text(
                state.message,
                style: blackTextStyle,
              ),
            );
          }

          if (state is ListSurahSuccess) {
            return BlocProvider(
              create: (context) =>
                  LocalListSurahBloc()..add(LocalListSurahGetEvent()),
              child: BlocBuilder<LocalListSurahBloc, LocalListSurahState>(
                builder: (context, state) {
                  if (state is LocalListSurahError) {
                    return Center(
                      child: Text(
                        state.message,
                        style: blackTextStyle,
                      ),
                    );
                  }

                  if (state is LocalListSurahLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  if (state is LocalListSurahSuccess) {
                    final List<ListSurahModel> data = state.surahs;

                    return RawScrollbar(
                      interactive: true,
                      thickness: 10.0,
                      scrollbarOrientation: ScrollbarOrientation.left,
                      thumbColor: ColorName.accent100Color,
                      radius: const Radius.circular(10),
                      child: ListView.builder(
                        itemBuilder: (context, index) {
                          final itemIndex = index ~/ 2;
                          final surah = data[itemIndex];
                          if (index.isOdd) {
                            return const Divider(
                              color: ColorName.bg200Color,
                              height: 2,
                            );
                          }

                          return Material(
                            child: InkWell(
                              highlightColor:
                                  ColorName.bg200Color.withOpacity(0.4),
                              splashColor:
                                  ColorName.bg300Color.withOpacity(0.5),
                              onTap: () {
                                final reversedList =
                                    List<ListSurahModel>.from(data.reversed);
                                final selectedIndex =
                                    data.length - 1 - itemIndex;

                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return BlocProvider(
                                        create: (context) => DetailSurahBloc(),
                                        child: SurahDetailPage(
                                          listSurah: reversedList,
                                          initialIndex: selectedIndex,
                                          numberSurah:
                                              reversedList[selectedIndex]
                                                  .nomor
                                                  .toString(),
                                        ),
                                      );
                                    },
                                  ),
                                );
                              },
                              child: ListTile(
                                leading: Container(
                                  height: 46,
                                  width: 46,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      width: 4,
                                      color: ColorName.accentColor,
                                    ),
                                  ),
                                  child: Text(
                                    "${surah.nomor}",
                                    style: blackTextStyle.copyWith(
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                title: Text(
                                  "Surat ${surah.namaLatin ?? ''}",
                                  style: blackTextStyle.copyWith(
                                    fontSize: 18,
                                  ),
                                ),
                                subtitle: Text(
                                  "${surah.tempatTurun ?? ''} | ${surah.jumlahAyat} ayat",
                                  style: blackTextStyleSecondary,
                                ),
                                trailing: Text(
                                  surah.nama ?? '',
                                  style: arabicBlackStyle.copyWith(
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                        itemCount: max(0, data.length * 2 - 1),
                      ),
                    );
                  }

                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            );
          }

          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
