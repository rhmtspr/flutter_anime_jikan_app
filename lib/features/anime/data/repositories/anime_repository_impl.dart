import 'package:dio/dio.dart';
import '../../../../core/errors/failures.dart';
import '../../domain/entities/anime.dart';
import '../../domain/repositories/anime_repository.dart';
import '../datasources/anime_remote_datasource.dart';

class AnimeRepositoryImpl implements AnimeRepository {
  final AnimeRemoteDataSource remote;

  AnimeRepositoryImpl(this.remote);

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
}
