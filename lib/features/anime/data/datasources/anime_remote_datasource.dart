import 'package:dio/dio.dart';
import '../../../../core/constants/api_constants.dart';
import '../models/anime_model.dart';

abstract class AnimeRemoteDataSource {
  Future<List<AnimeModel>> getTopAnime({required int page});
  Future<List<AnimeModel>> searchAnime({
    required String query,
    required int page,
  });
  Future<AnimeModel> getAnimeDetail(int id);
}

class AnimeRemoteDataSourceImpl implements AnimeRemoteDataSource {
  final Dio dio;

  AnimeRemoteDataSourceImpl(this.dio);

  @override
  Future<List<AnimeModel>> getTopAnime({required int page}) async {
    final response = await dio.get(
      ApiConstants.topAnime,
      queryParameters: {'page': page},
    );

    final List data = response.data['data'];
    return data.map((e) => AnimeModel.fromJson(e)).toList();
  }

  @override
  Future<List<AnimeModel>> searchAnime({
    required String query,
    required int page,
  }) async {
    final response = await dio.get(
      ApiConstants.animeDetail,
      queryParameters: {'q': query, 'page': page},
    );

    final List data = response.data['data'];
    return data.map((e) => AnimeModel.fromJson(e)).toList();
  }

  @override
  Future<AnimeModel> getAnimeDetail(int id) async {
    final response = await dio.get('${ApiConstants.animeDetail}/$id');
    return AnimeModel.fromJson(response.data['data']);
  }
}
