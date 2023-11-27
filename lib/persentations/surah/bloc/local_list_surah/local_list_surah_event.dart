part of 'local_list_surah_bloc.dart';

sealed class LocalListSurahEvent extends Equatable {
  const LocalListSurahEvent();

  @override
  List<Object> get props => [];
}

class LocalListSurahGetEvent extends LocalListSurahEvent {}
