import '../../../../core/errors/failures.dart';
import '../entities/anime.dart';

abstract class AnimeRepository {
  Future<(Failure?, List<Anime>?)> getTopAnime(int page);
  Future<(Failure?, List<Anime>?)> searchAnime(String query, int page);
  Future<(Failure?, Anime?)> getAnimeDetail(int id);

  // Favorites
  List<Anime> getFavorites();
  Future<void> toggleFavorite(Anime anime);
  bool isFavorite(int id);
}
