import 'package:alquranapp/data/datasources/surah_remote_datasource.dart';
import 'package:alquranapp/data/models/list_surah_model.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'list_surah_event.dart';
part 'list_surah_state.dart';

class ListSurahBloc extends Bloc<ListSurahEvent, ListSurahState> {
  ListSurahBloc() : super(ListSurahInitial()) {
    on<ListSurahEvent>((event, emit) async {
      if (event is ListSurahGetEvent) {
        try {
          emit(ListSurahLoading());

          final response = await SurahRemoteDatasource().getListSurah();

          emit(ListSurahSuccess(response));
        } catch (e) {
          emit(ListSurahError(e.toString()));
        }
      }
    });
  }
}
