import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/anime.dart';
import '../../domain/usecases/get_top_anime.dart';

part 'anime_list_event.dart';
part 'anime_list_state.dart';

class AnimeListBloc extends Bloc<AnimeListEvent, AnimeListState> {
  final GetTopAnime getTopAnime;

  int _page = 1;
  bool _hasReachedMax = false;
  final List<Anime> _anime = [];

  AnimeListBloc(this.getTopAnime) : super(AnimeListInitial()) {
    on<FetchAnime>(_onFetchAnime);
  }

  Future<void> _onFetchAnime(
    FetchAnime event,
    Emitter<AnimeListState> emit,
  ) async {
    if (_hasReachedMax) return;

    if (_page == 1) {
      emit(AnimeListLoading());
    }

    final (failure, data) = await getTopAnime(_page);

    if (failure != null) {
      emit(AnimeListError(failure.message));
      return;
    }

    if (data == null || data.isEmpty) {
      _hasReachedMax = true;
    } else {
      _page++;
      _anime.addAll(data);
    }

    emit(
      AnimeListLoaded(anime: List.from(_anime), hasReachedMax: _hasReachedMax),
    );
  }
}
