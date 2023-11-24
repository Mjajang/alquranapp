part of 'list_surah_bloc.dart';

sealed class ListSurahState extends Equatable {
  const ListSurahState();

  @override
  List<Object> get props => [];
}

final class ListSurahInitial extends ListSurahState {}

final class ListSurahLoading extends ListSurahState {}

final class ListSurahError extends ListSurahState {
  final String message;

  const ListSurahError(this.message);

  @override
  List<Object> get props => [message];
}

final class ListSurahSuccess extends ListSurahState {
  final ListSurahModelResponse response;

  const ListSurahSuccess(this.response);

  @override
  List<Object> get props => [response];
}
