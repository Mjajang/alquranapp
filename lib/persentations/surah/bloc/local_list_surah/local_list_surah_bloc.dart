import 'package:alquranapp/data/datasources/surah_local_datasource.dart';
import 'package:alquranapp/data/models/list_surah_model.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'local_list_surah_event.dart';
part 'local_list_surah_state.dart';

class LocalListSurahBloc
    extends Bloc<LocalListSurahEvent, LocalListSurahState> {
  LocalListSurahBloc() : super(LocalListSurahInitial()) {
    on<LocalListSurahEvent>((event, emit) async {
      if (event is LocalListSurahGetEvent) {
        try {
          emit(LocalListSurahLoading());

          final List<ListSurahModel> surahs =
              await SurahLocalDatasource().getLocalListSurah();

          emit(LocalListSurahSuccess(surahs));
        } catch (e) {
          emit(LocalListSurahError(e.toString()));
        }
      }
    });
  }
}
