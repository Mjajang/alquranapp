part of 'detail_surah_bloc.dart';

sealed class DetailSurahState extends Equatable {
  const DetailSurahState();

  @override
  List<Object> get props => [];
}

final class DetailSurahInitial extends DetailSurahState {}

final class DetailSurahLoading extends DetailSurahState {}

final class DetailSurahError extends DetailSurahState {
  final String message;

  const DetailSurahError(this.message);

  @override
  List<Object> get props => [message];
}

final class DetailSurahSuccess extends DetailSurahState {
  final DetailSurahResponseModel response;

  const DetailSurahSuccess(this.response);

  @override
  List<Object> get props => [response];
}
