import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/anime.dart';
import '../repositories/anime_repository.dart';

class SearchAnime
    implements UseCase<(Failure?, List<Anime>?), SearchAnimeParams> {
  final AnimeRepository repository;

  SearchAnime(this.repository);

  @override
  Future<(Failure?, List<Anime>?)> call(SearchAnimeParams params) {
    return repository.searchAnime(params.query, params.page);
  }
}

class SearchAnimeParams {
  final String query;
  final int page;

  const SearchAnimeParams({required this.query, required this.page});
}
