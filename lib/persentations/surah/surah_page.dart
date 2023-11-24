import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../common/constants/colors.dart';
import '../../common/constants/text_style.dart';
import 'bloc/list_surah/list_surah_bloc.dart';

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
                style: TextStyleName.blackTextStyle,
              ),
            );
          }

          if (state is ListSurahSuccess) {
            final data = state.response.data;
            return ListView.separated(
              itemBuilder: (context, index) {
                final surah = data[index];

                return ListTile(
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
                      style: TextStyleName.blackTextStyle.copyWith(
                        fontSize: 16,
                      ),
                    ),
                  ),
                  title: Text(
                    "Surat ${surah.namaLatin ?? ''}",
                    style: TextStyleName.blackTextStyle.copyWith(
                      fontSize: 18,
                    ),
                  ),
                  subtitle: Text(
                    "${surah.tempatTurun ?? ''} | ${surah.jumlahAyat} ayat",
                    style: TextStyleName.blackTextStyleSecondary,
                  ),
                  trailing: Text(
                    surah.nama ?? '',
                    style: TextStyleName.arabicBlackStyle.copyWith(
                      fontSize: 18,
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) => const Divider(
                color: ColorName.bg200Color,
              ),
              itemCount: data!.length,
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
