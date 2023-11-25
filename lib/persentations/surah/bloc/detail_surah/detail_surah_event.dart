part of 'detail_surah_bloc.dart';

sealed class DetailSurahEvent extends Equatable {
  const DetailSurahEvent();

  @override
  List<Object> get props => [];
}

class DetailSurahGetEvent extends DetailSurahEvent {
  final String numberSurah;

  const DetailSurahGetEvent(this.numberSurah);

  @override
  List<Object> get props => [numberSurah];
}
