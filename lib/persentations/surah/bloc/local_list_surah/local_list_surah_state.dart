part of 'local_list_surah_bloc.dart';

sealed class LocalListSurahState extends Equatable {
  const LocalListSurahState();

  @override
  List<Object> get props => [];
}

final class LocalListSurahInitial extends LocalListSurahState {}

final class LocalListSurahLoading extends LocalListSurahState {}

final class LocalListSurahError extends LocalListSurahState {
  final String message;

  const LocalListSurahError(this.message);

  @override
  List<Object> get props => [message];
}

final class LocalListSurahSuccess extends LocalListSurahState {
  final List<ListSurahModel> surahs;

  const LocalListSurahSuccess(this.surahs);

  @override
  List<Object> get props => [surahs];
}
