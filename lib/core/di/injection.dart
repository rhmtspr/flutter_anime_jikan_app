import 'package:anime_jikan_app/features/anime/data/datasources/anime_remote_datasource.dart';
import 'package:anime_jikan_app/features/anime/data/repositories/anime_repository_impl.dart';
import 'package:anime_jikan_app/features/anime/domain/repositories/anime_repository.dart';
import 'package:get_it/get_it.dart';
import '../network/dio_client.dart';
import 'package:hive/hive.dart';
import '../../features/anime/data/models/favorite_anime_model.dart';
import '../../features/anime/data/datasources/anime_local_datasource.dart';
import '../../features/anime/domain/usecases/get_top_anime.dart';
import '../../features/anime/domain/usecases/search_anime.dart';
import '../../features/anime/domain/usecases/get_anime_detail.dart';
import '../../features/anime/domain/usecases/toggle_favorite.dart';
import '../../features/anime/domain/usecases/get_favorites.dart';
import '../../features/anime/presentation/bloc/favorites_cubit.dart';
import '../../features/anime/presentation/bloc/anime_list_bloc.dart';
import '../../features/anime/presentation/bloc/search/search_bloc.dart';

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
  sl.registerLazySingleton<AnimeRepository>(
    () => AnimeRepositoryImpl(
      sl(), // remote
      sl(), // local
    ),
  );

  // Use cases
  sl.registerLazySingleton(() => GetTopAnime(sl()));
  sl.registerLazySingleton(() => SearchAnime(sl()));
  sl.registerLazySingleton(() => GetAnimeDetail(sl()));

  // Hive box
  sl.registerLazySingleton<Box<FavoriteAnimeModel>>(
    () => Hive.box<FavoriteAnimeModel>('favorites'),
  );

  // Local datasource
  sl.registerLazySingleton<AnimeLocalDataSource>(
    () => AnimeLocalDataSourceImpl(sl()),
  );

  // Favorite
  sl.registerLazySingleton(() => ToggleFavorite(sl()));
  sl.registerLazySingleton(() => GetFavorites(sl()));

  // Favorite Cubit
  sl.registerFactory(() => FavoritesCubit(sl(), sl()));

  // List
  sl.registerFactory(() => AnimeListBloc(sl()));

  // Search
  sl.registerFactory(() => SearchBloc(sl()));
}
