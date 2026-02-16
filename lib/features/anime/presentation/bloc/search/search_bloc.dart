import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/entities/anime.dart';
import '../../../domain/usecases/search_anime.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final SearchAnime searchAnime;

  Timer? _debounce;

  SearchBloc(this.searchAnime) : super(SearchInitial()) {
    on<SearchQueryChanged>(_onQueryChanged);
  }

  Future<void> _onQueryChanged(
    SearchQueryChanged event,
    Emitter<SearchState> emit,
  ) async {
    _debounce?.cancel();

    _debounce = Timer(const Duration(milliseconds: 500), () async {
      if (event.query.isEmpty) {
        emit(SearchInitial());
        return;
      }

      emit(SearchLoading());

      final (failure, data) = await searchAnime(
        SearchAnimeParams(query: event.query, page: 1),
      );

      if (failure != null) {
        emit(SearchError(failure.message));
      } else {
        emit(SearchLoaded(data ?? []));
      }
    });
  }

  @override
  Future<void> close() {
    _debounce?.cancel();
    return super.close();
  }
}
