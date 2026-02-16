import '../../../../core/usecases/usecase.dart';
import '../entities/anime.dart';
import '../repositories/anime_repository.dart';

class ToggleFavorite implements UseCase<void, Anime> {
  final AnimeRepository repository;

  ToggleFavorite(this.repository);

  @override
  Future<void> call(Anime anime) {
    return repository.toggleFavorite(anime);
  }
}
