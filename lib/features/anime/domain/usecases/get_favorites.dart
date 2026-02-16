import '../../../../core/usecases/usecase.dart';
import '../entities/anime.dart';
import '../repositories/anime_repository.dart';

class GetFavorites implements UseCase<List<Anime>, NoParams> {
  final AnimeRepository repository;

  GetFavorites(this.repository);

  @override
  Future<List<Anime>> call(NoParams params) async {
    return repository.getFavorites();
  }
}
