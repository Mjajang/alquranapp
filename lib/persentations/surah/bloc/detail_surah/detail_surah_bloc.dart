import 'package:alquranapp/data/datasources/detail_surah_remote_datasource.dart';
import 'package:alquranapp/data/models/detail_surah_model.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'detail_surah_event.dart';
part 'detail_surah_state.dart';

class DetailSurahBloc extends Bloc<DetailSurahEvent, DetailSurahState> {
  DetailSurahBloc() : super(DetailSurahInitial()) {
    on<DetailSurahEvent>((event, emit) async {
      if (event is DetailSurahGetEvent) {
        try {
          emit(DetailSurahLoading());

          final response = await DetailSurahRemoteDatasource()
              .getDetailSurah(event.numberSurah);

          emit(DetailSurahSuccess(response));
        } catch (e) {
          emit(DetailSurahError(e.toString()));
        }
      }
    });
  }
}
