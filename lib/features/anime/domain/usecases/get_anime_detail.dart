import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/anime.dart';
import '../repositories/anime_repository.dart';

class GetAnimeDetail implements UseCase<(Failure?, Anime?), int> {
  final AnimeRepository repository;

  GetAnimeDetail(this.repository);

  @override
  Future<(Failure?, Anime?)> call(int id) {
    return repository.getAnimeDetail(id);
  }
}
