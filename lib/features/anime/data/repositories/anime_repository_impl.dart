import '../../domain/entities/anime.dart';
import '../../domain/repositories/anime_repository.dart';
import '../datasources/anime_remote_datasource.dart';

class AnimeRepositoryImpl implements AnimeRepository {
  final AnimeRemoteDataSource remote;

  AnimeRepositoryImpl(this.remote);

  @override
  Future<List<Anime>> getTopAnime(int page) async {
    final models = await remote.getTopAnime(page: page);
    return models;
  }

  @override
  Future<List<Anime>> searchAnime(String query, int page) async {
    final models = await remote.searchAnime(query: query, page: page);
    return models;
  }

  @override
  Future<Anime> getAnimeDetail(int id) async {
    return await remote.getAnimeDetail(id);
  }
}
