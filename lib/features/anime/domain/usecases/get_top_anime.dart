import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/anime.dart';
import '../repositories/anime_repository.dart';

class GetTopAnime implements UseCase<(Failure?, List<Anime>?), int> {
  final AnimeRepository repository;

  GetTopAnime(this.repository);

  @override
  Future<(Failure?, List<Anime>?)> call(int page) {
    return repository.getTopAnime(page);
  }
}
