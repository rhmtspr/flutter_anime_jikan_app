import '../entities/anime.dart';

abstract class AnimeRepository {
  Future<List<Anime>> getTopAnime(int page);
  Future<List<Anime>> searchAnime(String query, int page);
  Future<Anime> getAnimeDetail(int id);
}
