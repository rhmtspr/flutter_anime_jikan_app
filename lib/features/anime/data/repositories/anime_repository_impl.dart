import 'package:dio/dio.dart';
import '../../../../core/errors/failures.dart';
import '../../domain/entities/anime.dart';
import '../../domain/repositories/anime_repository.dart';
import '../datasources/anime_remote_datasource.dart';
import '../datasources/anime_local_datasource.dart';
import '../models/favorite_anime_model.dart';

class AnimeRepositoryImpl implements AnimeRepository {
  final AnimeRemoteDataSource remote;
  final AnimeLocalDataSource local;

  AnimeRepositoryImpl(this.remote, this.local);

  @override
  Future<(Failure?, List<Anime>?)> getTopAnime(int page) async {
    try {
      final models = await remote.getTopAnime(page: page);
      return (null, models);
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionError) {
        return (const NetworkFailure(), null);
      }
      return (const ServerFailure(), null);
    } catch (_) {
      return (const UnknownFailure(), null);
    }
  }

  @override
  Future<(Failure?, List<Anime>?)> searchAnime(String query, int page) async {
    try {
      final models = await remote.searchAnime(query: query, page: page);
      return (null, models);
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionError) {
        return (const NetworkFailure(), null);
      }
      return (const ServerFailure(), null);
    } catch (_) {
      return (const UnknownFailure(), null);
    }
  }

  @override
  Future<(Failure?, Anime?)> getAnimeDetail(int id) async {
    try {
      final model = await remote.getAnimeDetail(id);
      return (null, model);
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionError) {
        return (const NetworkFailure(), null);
      }
      return (const ServerFailure(), null);
    } catch (_) {
      return (const UnknownFailure(), null);
    }
  }

  @override
  List<Anime> getFavorites() {
    final favorites = local.getFavorites();
    return favorites
        .map(
          (e) => Anime(
            id: e.id,
            title: e.title,
            imageUrl: e.imageUrl,
            score: e.score,
            synopsis: '',
          ),
        )
        .toList();
  }

  @override
  Future<void> toggleFavorite(Anime anime) async {
    final model = FavoriteAnimeModel(
      id: anime.id,
      title: anime.title,
      imageUrl: anime.imageUrl,
      score: anime.score,
    );

    await local.toggleFavorite(model);
  }

  @override
  bool isFavorite(int id) {
    return local.isFavorite(id);
  }
}
