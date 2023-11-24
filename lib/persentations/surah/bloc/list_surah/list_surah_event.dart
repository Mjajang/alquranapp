part of 'list_surah_bloc.dart';

sealed class ListSurahEvent extends Equatable {
  const ListSurahEvent();

  @override
  List<Object> get props => [];
}

class ListSurahGetEvent extends ListSurahEvent {}
