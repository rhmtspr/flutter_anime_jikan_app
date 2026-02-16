import 'package:anime_jikan_app/app.dart';
import 'package:anime_jikan_app/core/di/injection.dart';
import 'package:anime_jikan_app/features/anime/presentation/bloc/anime_list_bloc.dart';
import 'package:anime_jikan_app/features/anime/presentation/bloc/favorites_cubit.dart';
import 'package:anime_jikan_app/features/anime/presentation/bloc/search/search_bloc.dart';
import 'package:anime_jikan_app/features/anime/presentation/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'features/anime/data/models/favorite_anime_model.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();

  // Register adapter
  Hive.registerAdapter(FavoriteAnimeModelAdapter());

  // Open box
  await Hive.openBox<FavoriteAnimeModel>('favorites');

  await initDependencies();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => sl<AnimeListBloc>()),
        BlocProvider(create: (_) => sl<SearchBloc>()),
        BlocProvider(create: (_) => sl<FavoritesCubit>()..loadFavorites()),
      ],
      child: const AnimeExplorerApp(),
    ),
  );
}
