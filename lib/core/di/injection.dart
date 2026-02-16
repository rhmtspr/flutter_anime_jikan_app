import 'package:anime_jikan_app/features/anime/data/datasources/anime_remote_datasource.dart';
import 'package:anime_jikan_app/features/anime/data/repositories/anime_repository_impl.dart';
import 'package:anime_jikan_app/features/anime/domain/repositories/anime_repository.dart';
import 'package:get_it/get_it.dart';
import '../network/dio_client.dart';

import '../../features/anime/domain/usecases/get_top_anime.dart';
import '../../features/anime/domain/usecases/search_anime.dart';
import '../../features/anime/domain/usecases/get_anime_detail.dart';

final sl = GetIt.instance;

Future<void> initDependencies() async {
  // Core
  sl.registerLazySingleton(() => DioClient());
  sl.registerLazySingleton(() => sl<DioClient>().dio);

  // Datasources
  sl.registerLazySingleton<AnimeRemoteDataSource>(
    () => AnimeRemoteDataSourceImpl(sl()),
  );

  // Repository
  sl.registerLazySingleton<AnimeRepository>(() => AnimeRepositoryImpl(sl()));

  // Use cases
  sl.registerLazySingleton(() => GetTopAnime(sl()));
  sl.registerLazySingleton(() => SearchAnime(sl()));
  sl.registerLazySingleton(() => GetAnimeDetail(sl()));
}
